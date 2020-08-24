Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 899ED24FFC7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Aug 2020 16:27:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725958AbgHXO1l (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Aug 2020 10:27:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725906AbgHXO1k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Aug 2020 10:27:40 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 084B6C061573
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Aug 2020 07:27:40 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0C27C279;
        Mon, 24 Aug 2020 16:27:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1598279247;
        bh=BaWCy202+1xzth0ups7wyw9wuDTquTsR72Z6+0I2j+A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lDNlsTLw/is8IJsOZK7orQcTcwpGmTDPAGXNwfIqP9vkomQ+llfsm0wHPSRZCKq7R
         ggZBLPceKPR+kLkHNQmp1ER5c5oYNZJcGvu0CXSvd8rcwRjRihl5FbPtOrebL8lN81
         dUe4smwuMEy99gWDVKUi6lAYadmwxr/I7KdbfsO4=
Date:   Mon, 24 Aug 2020 17:27:07 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [kmsxx] [PATCH 1/2] card: Add support for writeback connectors
Message-ID: <20200824142707.GE6002@pendragon.ideasonboard.com>
References: <20200823221152.31978-1-laurent.pinchart@ideasonboard.com>
 <20200823221152.31978-2-laurent.pinchart@ideasonboard.com>
 <e8479aa0-1506-682b-5124-30be2e865ad4@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e8479aa0-1506-682b-5124-30be2e865ad4@ti.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Tomi,

On Mon, Aug 24, 2020 at 09:30:35AM +0300, Tomi Valkeinen wrote:
> On 24/08/2020 01:11, Laurent Pinchart wrote:
> > Enable enumeration of writeback connectors if both libdrm and the device
> > support it. The new Card::has_writeback() method report if the card
> > support writeback connectors.
> > 
> > Existing code that expect all connectors to model an output may be
> > confused by the sudden availability of new connectors. To handle this
> > issue,
> > 
> > - add a KMSXX_DISABLE_WRITEBACK_CONNECTORS environment variable to
> >   disable enumeration of writeback connectors, similarly to universal
> >   planes ; and
> > 
> > - ignore writeback connectors where no specific connector is requested
> >   (Card::get_first_connected_connector(),
> >   ResourceManager::reserve_connector() if no connector name is
> >   specified, and applications that use all connected outputs).
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  kms++/inc/kms++/card.h            |  2 ++
> >  kms++/src/card.cpp                | 13 +++++++++++++
> >  kms++/src/connector.cpp           |  1 +
> >  kms++util/CMakeLists.txt          |  2 ++
> >  kms++util/src/resourcemanager.cpp |  5 +++++
> >  py/pykms/pykmsbase.cpp            |  1 +
> >  utils/kmsblank.cpp                |  5 +++++
> >  utils/kmstest.cpp                 |  4 ++++
> >  8 files changed, 33 insertions(+)
> > 
> > diff --git a/kms++/inc/kms++/card.h b/kms++/inc/kms++/card.h
> > index 0a7eaaf81a8d..26468edbb503 100644
> > --- a/kms++/inc/kms++/card.h
> > +++ b/kms++/inc/kms++/card.h
> > @@ -53,6 +53,7 @@ public:
> >  	bool has_universal_planes() const { return m_has_universal_planes; }
> >  	bool has_dumb_buffers() const { return m_has_dumb; }
> >  	bool has_kms() const;
> > +	bool has_writeback() const { return m_has_writeback; }
> >  
> >  	std::vector<Connector*> get_connectors() const { return m_connectors; }
> >  	std::vector<Encoder*> get_encoders() const { return m_encoders; }
> > @@ -91,6 +92,7 @@ private:
> >  	bool m_has_atomic;
> >  	bool m_has_universal_planes;
> >  	bool m_has_dumb;
> > +	bool m_has_writeback;
> >  
> >  	CardVersion m_version;
> >  };
> > diff --git a/kms++/src/card.cpp b/kms++/src/card.cpp
> > index 3a7ab700ed49..cbb5d50b505f 100644
> > --- a/kms++/src/card.cpp
> > +++ b/kms++/src/card.cpp
> > @@ -217,6 +217,17 @@ void Card::setup()
> >  	m_has_atomic = false;
> >  #endif
> >  
> > +#ifdef DRM_CLIENT_CAP_WRITEBACK_CONNECTORS
> > +	if (getenv("KMSXX_DISABLE_WRITEBACK_CONNECTORS") == 0) {
> > +		r = drmSetClientCap(m_fd, DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
> > +		m_has_writeback = r == 0;
> > +	} else {
> > +		m_has_writeback = false;
> > +	}
> > +#else
> > +	m_has_writeback = false;
> > +#endif
> > +
> >  	uint64_t has_dumb;
> >  	r = drmGetCap(m_fd, DRM_CAP_DUMB_BUFFER, &has_dumb);
> >  	m_has_dumb = r == 0 && has_dumb;
> > @@ -316,6 +327,8 @@ void Card::restore_modes()
> >  Connector* Card::get_first_connected_connector() const
> >  {
> >  	for(auto c : m_connectors) {
> > +		if (c->connector_type() == DRM_MODE_CONNECTOR_WRITEBACK)
> > +			continue;
> >  		if (c->connected())
> >  			return c;
> >  	}
> > diff --git a/kms++/src/connector.cpp b/kms++/src/connector.cpp
> > index a40861957c67..6f5f79f0e523 100644
> > --- a/kms++/src/connector.cpp
> > +++ b/kms++/src/connector.cpp
> > @@ -36,6 +36,7 @@ static const map<int, string> connector_names = {
> >  	{ DRM_MODE_CONNECTOR_VIRTUAL, "Virtual" },
> >  	{ DRM_MODE_CONNECTOR_DSI, "DSI" },
> >  	{ DRM_MODE_CONNECTOR_DPI, "DPI" },
> > +	{ DRM_MODE_CONNECTOR_WRITEBACK, "writeback" },
> >  };
> >  
> >  static const map<int, string> connection_str = {
> > diff --git a/kms++util/CMakeLists.txt b/kms++util/CMakeLists.txt
> > index 0bfb56b0d58f..362824ad13d5 100644
> > --- a/kms++util/CMakeLists.txt
> > +++ b/kms++util/CMakeLists.txt
> > @@ -1,3 +1,5 @@
> > +include_directories(${LIBDRM_INCLUDE_DIRS})
> > +
> >  file(GLOB SRCS "src/*.cpp" "src/*.h")
> >  file(GLOB PUB_HDRS "inc/kms++util/*.h")
> >  add_library(kms++util ${SRCS} ${PUB_HDRS})
> > diff --git a/kms++util/src/resourcemanager.cpp b/kms++util/src/resourcemanager.cpp
> > index 5a9f016c06ab..01edaf39202b 100644
> > --- a/kms++util/src/resourcemanager.cpp
> > +++ b/kms++util/src/resourcemanager.cpp
> > @@ -2,6 +2,8 @@
> >  #include <algorithm>
> >  #include <kms++util/strhelpers.h>
> >  
> > +#include <xf86drmMode.h>
> 
> This and adding the LIBDRM_INCLUDE_DIRS is not ok. I don't want kms++
> to leak libdrm C headers.

I was expecting that feedback :-)

> We need to add an enum class for connector types, and map the libdrm
> types to that.
> 
> As a simple quick alternative, I think just conn->is_writeback() would
> do the trick, as we have no users for the connector type as such.

Should I go for that, or byte the bullet and wrap the connector types ?

-- 
Regards,

Laurent Pinchart

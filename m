Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95E952500CB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Aug 2020 17:21:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727862AbgHXPVN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Aug 2020 11:21:13 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:33938 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727926AbgHXPUw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Aug 2020 11:20:52 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07OEv4CF101904;
        Mon, 24 Aug 2020 09:57:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1598281024;
        bh=1ksXVRAtXnmgWmBn+oyUCdrXfryQgPsaFJQ65Ho+2r0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=f36w4Vp8o3LYatlD9ne7Wbl7TI+gwITAcOUvdJfiipFaIwcaipxvPtpKgoK9Q0LV7
         uyb3jtaK+dVwnllBavzeb3DKPt4HAp1XTPqIWZX6ZBFg15Vcy2AqmKAO42j8+tHRRO
         yt17e+SdiOJbot4/jvcS2tjlXr8yH7ce2m9qb/3g=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07OEv3IZ110919
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 24 Aug 2020 09:57:03 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 24
 Aug 2020 09:57:03 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 24 Aug 2020 09:57:03 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07OEv285115626;
        Mon, 24 Aug 2020 09:57:03 -0500
Subject: Re: [kmsxx] [PATCH 1/2] card: Add support for writeback connectors
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     <linux-renesas-soc@vger.kernel.org>
References: <20200823221152.31978-1-laurent.pinchart@ideasonboard.com>
 <20200823221152.31978-2-laurent.pinchart@ideasonboard.com>
 <e8479aa0-1506-682b-5124-30be2e865ad4@ti.com>
 <20200824142707.GE6002@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <9158ee44-40c1-7313-1ae0-90720dcf370d@ti.com>
Date:   Mon, 24 Aug 2020 17:57:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200824142707.GE6002@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 24/08/2020 17:27, Laurent Pinchart wrote:
> Hi Tomi,
> 
> On Mon, Aug 24, 2020 at 09:30:35AM +0300, Tomi Valkeinen wrote:
>> On 24/08/2020 01:11, Laurent Pinchart wrote:
>>> Enable enumeration of writeback connectors if both libdrm and the device
>>> support it. The new Card::has_writeback() method report if the card
>>> support writeback connectors.
>>>
>>> Existing code that expect all connectors to model an output may be
>>> confused by the sudden availability of new connectors. To handle this
>>> issue,
>>>
>>> - add a KMSXX_DISABLE_WRITEBACK_CONNECTORS environment variable to
>>>   disable enumeration of writeback connectors, similarly to universal
>>>   planes ; and
>>>
>>> - ignore writeback connectors where no specific connector is requested
>>>   (Card::get_first_connected_connector(),
>>>   ResourceManager::reserve_connector() if no connector name is
>>>   specified, and applications that use all connected outputs).
>>>
>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> ---
>>>  kms++/inc/kms++/card.h            |  2 ++
>>>  kms++/src/card.cpp                | 13 +++++++++++++
>>>  kms++/src/connector.cpp           |  1 +
>>>  kms++util/CMakeLists.txt          |  2 ++
>>>  kms++util/src/resourcemanager.cpp |  5 +++++
>>>  py/pykms/pykmsbase.cpp            |  1 +
>>>  utils/kmsblank.cpp                |  5 +++++
>>>  utils/kmstest.cpp                 |  4 ++++
>>>  8 files changed, 33 insertions(+)
>>>
>>> diff --git a/kms++/inc/kms++/card.h b/kms++/inc/kms++/card.h
>>> index 0a7eaaf81a8d..26468edbb503 100644
>>> --- a/kms++/inc/kms++/card.h
>>> +++ b/kms++/inc/kms++/card.h
>>> @@ -53,6 +53,7 @@ public:
>>>  	bool has_universal_planes() const { return m_has_universal_planes; }
>>>  	bool has_dumb_buffers() const { return m_has_dumb; }
>>>  	bool has_kms() const;
>>> +	bool has_writeback() const { return m_has_writeback; }
>>>  
>>>  	std::vector<Connector*> get_connectors() const { return m_connectors; }
>>>  	std::vector<Encoder*> get_encoders() const { return m_encoders; }
>>> @@ -91,6 +92,7 @@ private:
>>>  	bool m_has_atomic;
>>>  	bool m_has_universal_planes;
>>>  	bool m_has_dumb;
>>> +	bool m_has_writeback;
>>>  
>>>  	CardVersion m_version;
>>>  };
>>> diff --git a/kms++/src/card.cpp b/kms++/src/card.cpp
>>> index 3a7ab700ed49..cbb5d50b505f 100644
>>> --- a/kms++/src/card.cpp
>>> +++ b/kms++/src/card.cpp
>>> @@ -217,6 +217,17 @@ void Card::setup()
>>>  	m_has_atomic = false;
>>>  #endif
>>>  
>>> +#ifdef DRM_CLIENT_CAP_WRITEBACK_CONNECTORS
>>> +	if (getenv("KMSXX_DISABLE_WRITEBACK_CONNECTORS") == 0) {
>>> +		r = drmSetClientCap(m_fd, DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
>>> +		m_has_writeback = r == 0;
>>> +	} else {
>>> +		m_has_writeback = false;
>>> +	}
>>> +#else
>>> +	m_has_writeback = false;
>>> +#endif
>>> +
>>>  	uint64_t has_dumb;
>>>  	r = drmGetCap(m_fd, DRM_CAP_DUMB_BUFFER, &has_dumb);
>>>  	m_has_dumb = r == 0 && has_dumb;
>>> @@ -316,6 +327,8 @@ void Card::restore_modes()
>>>  Connector* Card::get_first_connected_connector() const
>>>  {
>>>  	for(auto c : m_connectors) {
>>> +		if (c->connector_type() == DRM_MODE_CONNECTOR_WRITEBACK)
>>> +			continue;
>>>  		if (c->connected())
>>>  			return c;
>>>  	}
>>> diff --git a/kms++/src/connector.cpp b/kms++/src/connector.cpp
>>> index a40861957c67..6f5f79f0e523 100644
>>> --- a/kms++/src/connector.cpp
>>> +++ b/kms++/src/connector.cpp
>>> @@ -36,6 +36,7 @@ static const map<int, string> connector_names = {
>>>  	{ DRM_MODE_CONNECTOR_VIRTUAL, "Virtual" },
>>>  	{ DRM_MODE_CONNECTOR_DSI, "DSI" },
>>>  	{ DRM_MODE_CONNECTOR_DPI, "DPI" },
>>> +	{ DRM_MODE_CONNECTOR_WRITEBACK, "writeback" },
>>>  };
>>>  
>>>  static const map<int, string> connection_str = {
>>> diff --git a/kms++util/CMakeLists.txt b/kms++util/CMakeLists.txt
>>> index 0bfb56b0d58f..362824ad13d5 100644
>>> --- a/kms++util/CMakeLists.txt
>>> +++ b/kms++util/CMakeLists.txt
>>> @@ -1,3 +1,5 @@
>>> +include_directories(${LIBDRM_INCLUDE_DIRS})
>>> +
>>>  file(GLOB SRCS "src/*.cpp" "src/*.h")
>>>  file(GLOB PUB_HDRS "inc/kms++util/*.h")
>>>  add_library(kms++util ${SRCS} ${PUB_HDRS})
>>> diff --git a/kms++util/src/resourcemanager.cpp b/kms++util/src/resourcemanager.cpp
>>> index 5a9f016c06ab..01edaf39202b 100644
>>> --- a/kms++util/src/resourcemanager.cpp
>>> +++ b/kms++util/src/resourcemanager.cpp
>>> @@ -2,6 +2,8 @@
>>>  #include <algorithm>
>>>  #include <kms++util/strhelpers.h>
>>>  
>>> +#include <xf86drmMode.h>
>>
>> This and adding the LIBDRM_INCLUDE_DIRS is not ok. I don't want kms++
>> to leak libdrm C headers.
> 
> I was expecting that feedback :-)
> 
>> We need to add an enum class for connector types, and map the libdrm
>> types to that.
>>
>> As a simple quick alternative, I think just conn->is_writeback() would
>> do the trick, as we have no users for the connector type as such.
> 
> Should I go for that, or byte the bullet and wrap the connector types ?

At the moment I don't see a need exposing the connector types. Usually it's better to only add code
that's actually used for something =).

So I'd just go with the helper function. Although while thinking about this, I wonder if an inverse
helper would be better, like is_display() or such. As that's what the callers are looking for, a
connector that can be used as a display.

That said, I don't know what other non-display connectors we might have. Still, usually, I think a
bool helper is better if it's checking for the thing we actually want (a display).

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

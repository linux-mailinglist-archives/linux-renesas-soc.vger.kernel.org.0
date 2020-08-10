Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5F152401CE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Aug 2020 07:54:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725774AbgHJFy0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Aug 2020 01:54:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725763AbgHJFy0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Aug 2020 01:54:26 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0B5CC061756
        for <linux-renesas-soc@vger.kernel.org>; Sun,  9 Aug 2020 22:54:25 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CE5FCF9;
        Mon, 10 Aug 2020 07:54:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1597038861;
        bh=JipLQtwX0kIktpzxS6UNc4ODKs3k7ZTl88JgCfDFe0M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OteWi0opmHmzNG4YbibXqZo3eqld4BzJdfsjP62WOJZYaL/m9ci5/iMczfU4qwF5g
         Js+KC+0/MnoSzaRF23v/VTSTWyPvCGIp+XRLwEKQOIWqxlbIOdjaVW5rSeauXvGT4a
         Zt20tr8bWi9BawZhpN97e0G27Pvz4hiAeHn4F9Wo=
Date:   Mon, 10 Aug 2020 08:54:08 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/8] card: Add a method to retrieve the device minor
Message-ID: <20200810055408.GE12018@pendragon.ideasonboard.com>
References: <20200806021807.21863-1-laurent.pinchart@ideasonboard.com>
 <20200806021807.21863-2-laurent.pinchart@ideasonboard.com>
 <0cf559a3-881b-9190-a108-35a298954b24@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0cf559a3-881b-9190-a108-35a298954b24@ti.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Tomi,

On Thu, Aug 06, 2020 at 10:46:43AM +0300, Tomi Valkeinen wrote:
> On 06/08/2020 05:17, Laurent Pinchart wrote:
> > The device minor number is needed to access the debugfs directory
> > corresponding to the device. Make it available to users through a
> > get_minor() method on the Card object.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  kms++/inc/kms++/card.h |  3 +++
> >  kms++/src/card.cpp     | 11 +++++++++++
> >  py/pykms/pykmsbase.cpp |  1 +
> >  3 files changed, 15 insertions(+)
> > 
> > diff --git a/kms++/inc/kms++/card.h b/kms++/inc/kms++/card.h
> > index 5c1cf7cfcedc..0a11747f7985 100644
> > --- a/kms++/inc/kms++/card.h
> > +++ b/kms++/inc/kms++/card.h
> > @@ -35,6 +35,7 @@ public:
> >  	Card& operator=(const Card& other) = delete;
> >  
> >  	int fd() const { return m_fd; }
> > +	unsigned int dev_minor() const { return m_minor; }
> >  
> >  	void drop_master();
> >  
> > @@ -84,7 +85,9 @@ private:
> >  	std::vector<Framebuffer*> m_framebuffers;
> >  
> >  	int m_fd;
> > +	unsigned int m_minor;
> >  	bool m_is_master;
> > +	std::string m_device;
> 
> This looks like an extra change.

Oops, indeed.

Should I submit a v2 of the whole series to address your other concerns,
or do you plan to already merge some of the patches ? In the latter
case, feel free to give this small issue when applying :-) (along with
s/get_minor/dev_minor/ in the commit message as pointed our by Sergei).

-- 
Regards,

Laurent Pinchart

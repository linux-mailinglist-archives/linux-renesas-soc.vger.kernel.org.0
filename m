Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DCF736DD7
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2019 09:54:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726762AbfFFHyv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Jun 2019 03:54:51 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35288 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbfFFHyv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jun 2019 03:54:51 -0400
Received: from pendragon.ideasonboard.com (unknown [IPv6:2a02:a03f:44f0:8500:ca05:8177:199c:fed4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7734B84;
        Thu,  6 Jun 2019 09:54:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1559807689;
        bh=YlCMVFQKmnEdokPv5gB9wXZ+eMS08U1QKRrygba8Uuc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NO0PaY0GTCfZ+ORNuBNR/vRY4r05Qqn4ad797zi5uoVK8GX2Kq87CK/r8OuWbKQdj
         gD1DFvHmi3qsDww5CCKdh0Wducb+u+uFVgcXg7bG4xLpX5hETyDO4aSHUQf6C9B2v5
         ZaxIAZYcMHtgKwVpKQ2rKLaYigrfAkYOig7Q1DcU=
Date:   Thu, 6 Jun 2019 10:54:35 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     devicetree@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v3 04/10] dt-bindings: display: renesas: lvds: Add
 renesas, companion property
Message-ID: <20190606075435.GD4931@pendragon.ideasonboard.com>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190528141234.15425-5-laurent.pinchart+renesas@ideasonboard.com>
 <20190528163730.GA9610@ravnborg.org>
 <20190528164916.GA17874@pendragon.ideasonboard.com>
 <20190528165900.GA10262@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190528165900.GA10262@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sam,

On Tue, May 28, 2019 at 06:59:00PM +0200, Sam Ravnborg wrote:
> Hi Laurent.
> 
> > > >  
> > > > +Optional properties:
> > > > +
> > > > +- renesas,companion : phandle to the companion LVDS encoder. This property is
> > > > +  mandatory for the first LVDS encoder on D3 and E3 SoCs, and shall point to
> > > > +  the second encoder to be used as a companion in dual-link mode. It shall not
> > > > +  be set for any other LVDS encoder.
> > > 
> > > If the D3 and E3 socs do not mandate the use of dual-link, then what to
> > > do in the DT? Because according to the above this property must be
> > > specified for D3 and E3 SOC's.
> > 
> > This property doesn't enable dual-link mode, it only specifies the
> > companion LVDS encoder used for dual-link mode, when enabled (through
> > communication between the LVDS encoder and the LVDS receiver at
> > runtime).
> > 
> > Jacopo had a similar comment so I suppose this isn't clear. How would
> > you word it to make it clear ?
> 
> Let me try:
> 
> - renesas,companion : phandle to the companion LVDS encoder. This property is
>   mandatory for the first LVDS encoder on D3 and E3 SoCs when dual-link mode
>   is supported.
>   The property shall pont to the phandle of the second encoder to be used as a
>   companion in dual-link mode. It shall not be set for any other LVDS encoder.
> 
> The main difference is "when dual-link mode is supported".
> As per my understanding this property is only relevant when the actual
> HW supports / uses dual-link mode.
> So for a board that do not even wire up dual-link, then setting the
> property would be confusing.

That's not quite correct. The property shall be specified when the SoC
supports dual-link mode (which is the case for the D3 and E3 SoCs only),
regardless of whether the board is wired up in single-link or dual-link
mode. Selection of the mode is performed at runtime by looking at the
requirements of the LVDS sink, not based on the companion property in
DT. The renesas,companion property is thus SoC-specific, but not
board-specific.

> I hope this better describes my understanding.

-- 
Regards,

Laurent Pinchart

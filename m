Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23FAF2CCCA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2019 18:59:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727003AbfE1Q7F (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 May 2019 12:59:05 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:37511 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726911AbfE1Q7F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 May 2019 12:59:05 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 3AFF920045;
        Tue, 28 May 2019 18:59:02 +0200 (CEST)
Date:   Tue, 28 May 2019 18:59:00 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v3 04/10] dt-bindings: display: renesas: lvds: Add
 renesas, companion property
Message-ID: <20190528165900.GA10262@ravnborg.org>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190528141234.15425-5-laurent.pinchart+renesas@ideasonboard.com>
 <20190528163730.GA9610@ravnborg.org>
 <20190528164916.GA17874@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190528164916.GA17874@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
        a=RqNDS8CZelupaJZLNH0A:9 a=CjuIK1q_8ugA:10
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent.

> > >  
> > > +Optional properties:
> > > +
> > > +- renesas,companion : phandle to the companion LVDS encoder. This property is
> > > +  mandatory for the first LVDS encoder on D3 and E3 SoCs, and shall point to
> > > +  the second encoder to be used as a companion in dual-link mode. It shall not
> > > +  be set for any other LVDS encoder.
> > 
> > If the D3 and E3 socs do not mandate the use of dual-link, then what to
> > do in the DT? Because according to the above this property must be
> > specified for D3 and E3 SOC's.
> 
> This property doesn't enable dual-link mode, it only specifies the
> companion LVDS encoder used for dual-link mode, when enabled (through
> communication between the LVDS encoder and the LVDS receiver at
> runtime).
> 
> Jacopo had a similar comment so I suppose this isn't clear. How would
> you word it to make it clear ?
Let me try:


- renesas,companion : phandle to the companion LVDS encoder. This property is
  mandatory for the first LVDS encoder on D3 and E3 SoCs when dual-link mode
  is supported.
  The property shall pont to the phandle of the second encoder to be used as a
  companion in dual-link mode. It shall not be set for any other LVDS encoder.

The main difference is "when dual-link mode is supported".
As per my understanding this property is only relevant when the actual
HW supports / uses dual-link mode.
So for a board that do not even wire up dual-link, then setting the
property would be confusing.

I hope this better describes my understanding.

	Sam

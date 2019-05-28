Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73C0F2CC33
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2019 18:37:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726650AbfE1Qhk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 May 2019 12:37:40 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:45898 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726579AbfE1Qhk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 May 2019 12:37:40 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id C48D4803EF;
        Tue, 28 May 2019 18:37:36 +0200 (CEST)
Date:   Tue, 28 May 2019 18:37:30 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v3 04/10] dt-bindings: display: renesas: lvds: Add
 renesas, companion property
Message-ID: <20190528163730.GA9610@ravnborg.org>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190528141234.15425-5-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190528141234.15425-5-laurent.pinchart+renesas@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=P1BnusSwAAAA:8
        a=xIEnxEUKAAAA:8 a=r9HNN9kqRSi6j70AMfAA:9 a=CjuIK1q_8ugA:10
        a=D0XLA9XvdZm18NrgonBM:22 a=JpDqF-G6Ufas406PgLIE:22
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent.

Reading through this nice series.

On Tue, May 28, 2019 at 05:12:28PM +0300, Laurent Pinchart wrote:
> Add a new optional renesas,companion property to point to the companion
> LVDS encoder. This is used to support dual-link operation where the main
> LVDS encoder splits even-numbered and odd-numbered pixels between the
> two LVDS encoders.
> 
> The new property doesn't control the mode of operation, it only
> describes the relationship between the master and companion LVDS
> encoders.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
> Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
> Changes since v2:
> 
> - Clarify when the companion property is required or not allowed
> 
> Changes since v1:
> 
> - Fixed typo
> ---
>  .../devicetree/bindings/display/bridge/renesas,lvds.txt    | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> index 900a884ad9f5..2d24bd8cbec5 100644
> --- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> @@ -45,6 +45,13 @@ OF graph bindings specified in Documentation/devicetree/bindings/graph.txt.
>  
>  Each port shall have a single endpoint.
>  
> +Optional properties:
> +
> +- renesas,companion : phandle to the companion LVDS encoder. This property is
> +  mandatory for the first LVDS encoder on D3 and E3 SoCs, and shall point to
> +  the second encoder to be used as a companion in dual-link mode. It shall not
> +  be set for any other LVDS encoder.

If the D3 and E3 socs do not mandate the use of dual-link, then what to
do in the DT? Because according to the above this property must be
specified for D3 and E3 SOC's.

> +
>  
>  Example:

Always good with examples, maybe it comes later.

	Sam

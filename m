Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0E76763B2D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jul 2023 17:36:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231475AbjGZPgE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Jul 2023 11:36:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229939AbjGZPgE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Jul 2023 11:36:04 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E75EB5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jul 2023 08:36:03 -0700 (PDT)
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9EA5A7F3;
        Wed, 26 Jul 2023 17:35:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1690385702;
        bh=q4qdmev3rut+KFre6+A0kekLQI5DgTO8ArsYE6dFk1g=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ZtW7ENx1Qn5vwwxx2YhTxxdaD7F9a1K2HBRwZwCy1Pidf8AHtYNsytwP2t70LRqkX
         mpeWxSag9fzI2dUigAwEwPg9qpLmis9l6qJVqcLYm58PhbsHWg9ZPcq6/aRWjDmjp9
         tB5u4ZQinJ36HyqxqoICe87BdoyUhEENBKsxDuTI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <a0d2858974207d5dbdae00a444ff5ee92e2ee4d3.1690382328.git.geert+renesas@glider.be>
References: <cover.1690382328.git.geert+renesas@glider.be> <a0d2858974207d5dbdae00a444ff5ee92e2ee4d3.1690382328.git.geert+renesas@glider.be>
Subject: Re: [PATCH 1/3] dt-bindings: irqchip: renesas,irqc: Add r8a779f0 support
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Date:   Wed, 26 Jul 2023 16:35:58 +0100
Message-ID: <169038575817.137962.7617633078043268733@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2023-07-26 15:44:41)
> Document support for the Interrupt Controller for External Devices
> (INT-EX) in the Renesas R-Car S4-8 (R8A779F0) SoC.
>=20

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/interrupt-controller/renesas,irqc.yaml   | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/renes=
as,irqc.yaml b/Documentation/devicetree/bindings/interrupt-controller/renes=
as,irqc.yaml
> index 95033cb514fbd8f6..b417341fc8ae049b 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc=
.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc=
.yaml
> @@ -37,6 +37,7 @@ properties:
>            - renesas,intc-ex-r8a77990    # R-Car E3
>            - renesas,intc-ex-r8a77995    # R-Car D3
>            - renesas,intc-ex-r8a779a0    # R-Car V3U
> +          - renesas,intc-ex-r8a779f0    # R-Car S4-8
>            - renesas,intc-ex-r8a779g0    # R-Car V4H
>        - const: renesas,irqc
> =20
> --=20
> 2.34.1
>

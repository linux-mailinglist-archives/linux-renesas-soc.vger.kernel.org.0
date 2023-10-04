Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E21F87B8103
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Oct 2023 15:33:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233319AbjJDNdT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Oct 2023 09:33:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242625AbjJDNdS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Oct 2023 09:33:18 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F427A9
        for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Oct 2023 06:33:15 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B6A3C433C8;
        Wed,  4 Oct 2023 13:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696426395;
        bh=nUcn/SlnQa7X885HtLaaj+Ehd4Cyq5smiyYTDJ4O40Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IYEXDVerwn8gbQaZr8uT9xcS9c3Qc/reUSTFLxs1Bqu28thOJ3w5dYndFwZQTGkUw
         ep2ha8cryDL+wXVEHO6OCQfTZhlUMIcyHL8Ef5m6stL+evB4pnTYf4Cag6eq6z/hUl
         eYLswZBEdCCNVe9T8E8nKxEvP/rQL+VGSG840n0sL4z0ytlX8uCX/l7HtrytJQE9bT
         T+RLjk0pQK0aq3H5L72gQRuH3zxIxGKBdWj/ehxdxZlkshTqyodo/w2gbMRK7XsvJH
         aVh/lsZsc9Nc+Rmrz87zw6KdltOwdJLT4VIxw+zWfvieS7vTSG7qD5bEjWDHvbQXg7
         z+Fu/BlgnsdsQ==
Received: (nullmailer pid 2758981 invoked by uid 1000);
        Wed, 04 Oct 2023 13:33:13 -0000
Date:   Wed, 4 Oct 2023 08:33:13 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Conor Dooley <conor+dt@kernel.org>,
        linux-riscv@lists.infradead.org,
        Palmer Dabbelt <palmer@rivosinc.com>,
        linux-renesas-soc@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: cache: andestech,ax45mp-cache: Fix unit
 address in example
Message-ID: <169642639171.2758908.6583867428160039532.robh@kernel.org>
References: <7b93655219a6ad696dd3faa9f36fde6b094694a9.1696330005.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b93655219a6ad696dd3faa9f36fde6b094694a9.1696330005.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


On Tue, 03 Oct 2023 12:47:59 +0200, Geert Uytterhoeven wrote:
> The unit address in the example does not match the reg property.
> Correct the unit address to match reality.
> 
> Fixes: 3e7bf4685e42786d ("dt-bindings: cache: andestech,ax45mp-cache: Add DT binding documentation for L2 cache controller")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/cache/andestech,ax45mp-cache.yaml       | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!


Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F3D667B083
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jan 2023 12:00:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235335AbjAYLAw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Jan 2023 06:00:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235377AbjAYLAv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jan 2023 06:00:51 -0500
Received: from mail.8bytes.org (mail.8bytes.org [IPv6:2a01:238:42d9:3f00:e505:6202:4f0c:f051])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5AD673E09E;
        Wed, 25 Jan 2023 03:00:49 -0800 (PST)
Received: from 8bytes.org (p200300c27714bc0086ad4f9d2505dd0d.dip0.t-ipconnect.de [IPv6:2003:c2:7714:bc00:86ad:4f9d:2505:dd0d])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.8bytes.org (Postfix) with ESMTPSA id A1D0E262E57;
        Wed, 25 Jan 2023 12:00:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
        s=default; t=1674644448;
        bh=pZqTenvwmUFMkjyLYQ4V32+jjuRTr49g3o4fyrl32Ig=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qf/m7S5sx+VJA52EV8ZN/vuJN/DLUeW1hDphjfhrAo2FREupHZC+uERwNp7XBkt+4
         jZJ27h6OK5h6VI/C3ea0uY1Le4vSb11VhVK7kIiETGRF2P0iKec1pSFjZEtEy0TDtB
         9/9NYXQgFg0jGKpuzvIxjT4jn+pwYvNL2wtYR+cyKC0F6h68s/GW5nlVS4G88GDoCI
         KCuezohGwq6s4TzOqbkUPgJClJFRT3SLS5eMnBB+AHhjuy0RvProTrI/59u6BsUr97
         uZweyoxkzcklhy3kvt3/hSxTj0+51iu6jc6nhfL7UUYS1/nHnOQos2sGsmGoeuW/7W
         le2nJq5kEwENg==
Date:   Wed, 25 Jan 2023 12:00:47 +0100
From:   Joerg Roedel <joro@8bytes.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     will@kernel.org, robin.murphy@arm.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: iommu: renesas,ipmmu-vmsa: add r8a779g0
 support
Message-ID: <Y9EL3yVHkfyssK+q@8bytes.org>
References: <20230119131833.1008752-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119131833.1008752-1-yoshihiro.shimoda.uh@renesas.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jan 19, 2023 at 10:18:33PM +0900, Yoshihiro Shimoda wrote:
> Document the compatible values for the IPMMU-VMSA blocks in
> the Renesas R-Car V4H (R8A779G0) SoC.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

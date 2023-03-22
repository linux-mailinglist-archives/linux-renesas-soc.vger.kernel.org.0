Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA1B56C4DA9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Mar 2023 15:29:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230458AbjCVO33 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Mar 2023 10:29:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230443AbjCVO32 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Mar 2023 10:29:28 -0400
Received: from mail.8bytes.org (mail.8bytes.org [IPv6:2a01:238:42d9:3f00:e505:6202:4f0c:f051])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9F7765F527;
        Wed, 22 Mar 2023 07:29:27 -0700 (PDT)
Received: from 8bytes.org (p200300c27714bc0086ad4f9d2505dd0d.dip0.t-ipconnect.de [IPv6:2003:c2:7714:bc00:86ad:4f9d:2505:dd0d])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.8bytes.org (Postfix) with ESMTPSA id 32C97242D42;
        Wed, 22 Mar 2023 15:29:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
        s=default; t=1679495366;
        bh=Jv9DBam1ZvrJHgi2acxCXub2R8fLuZxiLEp70g0vhXM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=8YzvI/jNt8PfYpiVWNWcv92Xuchhy5HSCrYMH0dL5n0Z9kMTvu1Nu8jQdR1GT6n9v
         emPYNWmoulXtNbaYr0P7K+xje/18mT3+ekENURsLC0pO8RnXfEvHCXshgIKRBXjjRw
         RrPTtv2TyrfsGWWf2H5Itd/IrlygU1NnBD1PjmLtPXqigkV7uDKrsrFsfdNc26XP4j
         LNEzpJLybeMHHzlMqYv4bOyN9hEwtoMwvQvLfvgG5MXPKpDDuT9LgK/bXOwcY2CneB
         fxn+HbcJIuN4Hp/G3V7evDz+kNdjsXmG6hKDH/MWz0/MNmId9He5BDBKC5nbtuuC10
         14dGxdihe1wXg==
Date:   Wed, 22 Mar 2023 15:29:25 +0100
From:   Joerg Roedel <joro@8bytes.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     will@kernel.org, robin.murphy@arm.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, geert+renesas@glider.be,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4] dt-bindings: iommu: renesas, ipmmu-vmsa: Update for
 R-Car Gen4
Message-ID: <ZBsQxUrziJUcWCJt@8bytes.org>
References: <20230313124026.954514-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230313124026.954514-1-yoshihiro.shimoda.uh@renesas.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Mar 13, 2023 at 09:40:26PM +0900, Yoshihiro Shimoda wrote:
>  .../bindings/iommu/renesas,ipmmu-vmsa.yaml    | 32 ++++++++++++++-----
>  1 file changed, 24 insertions(+), 8 deletions(-)

Applied, thanks.

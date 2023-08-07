Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96127772420
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Aug 2023 14:34:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231516AbjHGMeX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Aug 2023 08:34:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230054AbjHGMeW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Aug 2023 08:34:22 -0400
X-Greylist: delayed 490 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 07 Aug 2023 05:34:21 PDT
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9EF1F10D9
        for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Aug 2023 05:34:21 -0700 (PDT)
Received: from 8bytes.org (pd9fe94eb.dip0.t-ipconnect.de [217.254.148.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.8bytes.org (Postfix) with ESMTPSA id 2F1302802BA;
        Mon,  7 Aug 2023 14:26:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
        s=default; t=1691411170;
        bh=wmPL7XejhagU6uyZud+Zdk9aWQ7ayvhKT8YunsXvlpA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VB8+b01PeLz6+nkT8eci4WM95w3mmZP/8DM91limSRuWo91mbgwwMc7ZCyrN/GTyA
         PHaAR3o4a0xaAMhbxlM+SQKeHSlwJa/fzYp9I8BriaiAXBzSXy6xiXfGh8bVp/3QtM
         wx2DWHUOsKCPzTCuFSzw0MUTnBYcY6d3Tlj95s2UnM17l4lV4CQ/yOL5UZyFT82shI
         IfK/2xCvfjaZz3jmybRP58UrpDSMsx1PD//nROxPYzk1a/IOsaFKVdF6LP927jfM9r
         X1e6mjWyx0gU9wwEwW71gTK38P0VObFA3Gp9wRMoaYI5HZud5NNH/iXi4XJxmEgagt
         wW7Y/mxfaBGnw==
Date:   Mon, 7 Aug 2023 14:26:09 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        iommu@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4] iommu/ipmmu-vmsa: Convert to
 read_poll_timeout_atomic()
Message-ID: <ZNDi4dOwKdD6lwie@8bytes.org>
References: <649c7e09841b998c5c8d7fc274884a85e4b5bfe9.1689599528.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <649c7e09841b998c5c8d7fc274884a85e4b5bfe9.1689599528.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jul 17, 2023 at 03:14:40PM +0200, Geert Uytterhoeven wrote:
>  drivers/iommu/ipmmu-vmsa.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)

Applied, thanks.


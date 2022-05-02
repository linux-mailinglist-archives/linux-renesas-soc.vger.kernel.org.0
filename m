Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 475A1516EFC
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 May 2022 13:40:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384753AbiEBLoK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 May 2022 07:44:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384776AbiEBLn5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 May 2022 07:43:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77BB462C5;
        Mon,  2 May 2022 04:40:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 11B02612AC;
        Mon,  2 May 2022 11:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E01E0C385A4;
        Mon,  2 May 2022 11:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651491628;
        bh=+9BdMBJvtCvARcxERvlpORcAuEP5sMqsF7ADhizUlxU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JF7FO6u4EOe/eY3XRdN30d57qZKQ8Frv6OQbL3ix9ljBdQOfyDtUK+ObZQgz8dBur
         34v6k0l8RJuQiz3EdEKeOeJekP4VHdROkoWi+baMFusUlDekcboamJ3wE59U3Oqu/C
         p59yqPwBGxo1dJ7/A51rLxaQNKpqmwZzBX5iitIfVE22sJxRDgAH014Ts0G+T/toWq
         e0VKqkMV+YWls6OXb37m+ygBSiYafs+ruh+WEPhsNGUoO0eAYfDwn2omNvUomfpamb
         UdT25DIQkcMCO3OYhEKkDgBIrp99cL0ZHfSdhmUkWjVVoXvrgIZ8KO+SDlCqv5A6ek
         l1Ty8yGlec2kQ==
Date:   Mon, 2 May 2022 17:10:24 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: phy: renesas,usb2-phy: Document RZ/G2UL phy
 bindings
Message-ID: <Ym/DKMSmXFUVSF+C@matsya>
References: <20220423134752.143090-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220423134752.143090-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 23-04-22, 14:47, Biju Das wrote:
> Document USB phy bindings for RZ/G2UL SoC. RZ/G2UL USB phy is identical to
> one found on the RZ/G2L SoC. No driver changes are required as generic
> compatible string "renesas,rzg2l-usb2-phy" will be used as a fallback.

Applied, thanks

-- 
~Vinod

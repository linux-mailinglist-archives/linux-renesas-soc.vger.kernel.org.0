Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 995CD6C10F5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Mar 2023 12:38:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230218AbjCTLij (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Mar 2023 07:38:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230008AbjCTLih (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Mar 2023 07:38:37 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D701136E5;
        Mon, 20 Mar 2023 04:38:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DA8A7B80E42;
        Mon, 20 Mar 2023 11:38:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 714C1C433EF;
        Mon, 20 Mar 2023 11:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679312311;
        bh=YfQJfApGvnHfGU8gi0gNukjaGzsg84xu5lWbeqt0lnw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Eb0R3e1JjZqoZgzBIBGjddsyzF5oRvdKqX4zJzfcsM0/DnTdJPwvylLD+N+LKBRzx
         IUP4xObd68HKq8F/Qvpt1W8+ib5Odyumu8IK77yOV7UrOlBps49shv9e9/SC/xo2kz
         m0aAW+ll4AWGsB8I2maII0LRP6fC/xl2FJLRDWSewz86h49su8evjRUcjYOvGhEqEP
         OqxjJPCWzSjGCbGJ72Q91R07MKL6mi3EU3EI8GH5XvBh3WyMEz82QnPL2OuhZKfQhY
         kOBto01PJnNfY6OWt0wG8oiBvRdeyp56uvftv10KL3GXZXlc50hUNdkT6jkk/wjKoa
         ZZVIoO4TNk3KQ==
Date:   Mon, 20 Mar 2023 17:08:27 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Kishon Vijay Abraham I <kishon@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Andre Przywara <andre.przywara@arm.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Icenowy Zheng <uwu@icenowy.me>,
        Justin Chen <justinpopo6@gmail.com>,
        Al Cooper <alcooperx@gmail.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Rahul T R <r-ravikumar@ti.com>,
        Swapnil Jakhade <sjakhade@cadence.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Liu Ying <victor.liu@nxp.com>, Yuan Can <yuancan@huawei.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Miaoqian Lin <linmq006@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Amelie Delaunay <amelie.delaunay@foss.st.com>,
        Dan Carpenter <error27@gmail.com>,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        JC Kuo <jckuo@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Roger Quadros <rogerq@kernel.org>,
        Matt Ranostay <mranostay@ti.com>,
        Sinthu Raja <sinthu.raja@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tanmay Patil <t-patil@ti.com>,
        Siddharth Vadapalli <s-vadapalli@ti.com>,
        Lv Ruyi <lv.ruyi@zte.com.cn>, linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        kernel@pengutronix.de,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        dri-devel@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 00/31] phy: Convert to platform remove callback returning
 void
Message-ID: <ZBhFsyXyN4wHV5BB@matsya>
References: <20230307115900.2293120-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230307115900.2293120-1-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 07-03-23, 12:58, Uwe Kleine-König wrote:
> Hello,
> 
> this patch series adapts the platform drivers below drivers/phy to use the
> .remove_new() callback. Compared to the traditional .remove() callback
> .remove_new() returns no value. This is a good thing because the driver core
> doesn't (and cannot) cope for errors during remove. The only effect of a
> non-zero return value in .remove() is that the driver core emits a warning. The
> device is removed anyhow and an early return from .remove() usually yields a
> resource leak.
> 
> By changing the remove callback to return void driver authors cannot
> reasonably assume any more that there is some kind of cleanup later.
> 
> All drivers in drivers/spmi returned zero unconditionally in their remove
> callback, so they could all be converted trivially to .remove_new().
> 
> Note that this series depends on commit 5c5a7680e67b ("platform: Provide
> a remove callback that returns no value") which is included in v6.3-rc1.

Applied, thanks

-- 
~Vinod

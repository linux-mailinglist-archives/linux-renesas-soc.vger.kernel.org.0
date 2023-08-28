Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02F5478A83D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Aug 2023 10:53:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbjH1Iwx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Aug 2023 04:52:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229796AbjH1Iwb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Aug 2023 04:52:31 -0400
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4B14BF
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Aug 2023 01:52:28 -0700 (PDT)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37S6OAFx024620;
        Mon, 28 Aug 2023 03:52:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=PODMain02222019; bh=B6KJLTAdmFDxECd
        BGbyUKRAnHF4kQncp/v1Fnep0F4U=; b=Zlann/7U0btf8Xm/ENMLKKt2ZFde6zk
        m93u0U9MDZZ3S0hfoJUp/4dQV7CwGABlpbP8hLBoWosx11PlCanJ5k9an0fu1kvh
        /SlAMBlSCfytyGD2tjVY4Jgji6gPL6Wm86CqA0bJyQC/J9H+8kKEGOcxh+e+WZhZ
        GA95HSjQxRZbdvXLO59SgtsuoEOSx0M/GZ0Zho7u243yC73tRtL96cqkgZXz/WPw
        Bd8iw7iiXyxDmvQ0BgV5YzJeI3GLYA21YGEzWgc6dpCjI39lRC39eWAYhisRkYCK
        PCKzU49N666IUouAFY2t3a5OxCpyUo4JXIhSUpVgZNgFNisg04qihVg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
        by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sqesy9wqy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 28 Aug 2023 03:52:12 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Mon, 28 Aug
 2023 09:52:09 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Mon, 28 Aug 2023 09:52:09 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9484411AA;
        Mon, 28 Aug 2023 08:52:09 +0000 (UTC)
Date:   Mon, 28 Aug 2023 08:52:09 +0000
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
CC:     Lee Jones <lee@kernel.org>, <patches@opensource.cirrus.com>,
        "Geert Uytterhoeven" <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] mfd: arizona-i2c: Simplify probe()
Message-ID: <20230828085209.GK103419@ediswmail.ad.cirrus.com>
References: <20230826092721.55225-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230826092721.55225-1-biju.das.jz@bp.renesas.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: 05b0x_Xd6sozKM1M0AZ0H03WhPKzISAB
X-Proofpoint-GUID: 05b0x_Xd6sozKM1M0AZ0H03WhPKzISAB
X-Proofpoint-Spam-Reason: safe
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Aug 26, 2023 at 10:27:21AM +0100, Biju Das wrote:
> Simplify probe() by replacing device_get_match_data() and ID lookup for
> retrieving match data by i2c_get_match_data().
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Tested-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

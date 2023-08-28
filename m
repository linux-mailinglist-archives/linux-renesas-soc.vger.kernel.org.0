Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C7F778A83E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Aug 2023 10:53:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbjH1Iwx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Aug 2023 04:52:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229644AbjH1Iws (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Aug 2023 04:52:48 -0400
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D19BE5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Aug 2023 01:52:46 -0700 (PDT)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37S7jgMd001749;
        Mon, 28 Aug 2023 03:52:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=PODMain02222019; bh=sMmQSFG4FHPfHxB
        67WASV4zRHGELWn4ffaCMn5d2OUY=; b=HdW8Y9PwWT/tQRDXp8yIM84YO/gm5ZX
        HoDpEy6+S8nXn5icxa9ex6k7CtXE3ilzhCp2PR+6eXD4qSJnS90yA8Dk2WOA0Sr8
        y6df7W8zKbyzswrxco80UvCX4+mcSafndPnyh4XMmETb3hAH8W+WwW5pJlqPAbOT
        aWS5goSan+Wu4iUV8D03+2ci1HAWRA9rIiY62TrisUMPkrSQgW/VeTc64dZ6pvyZ
        Gqs+VBnCt9ggBhA3ZVl0vjz4sZ2+rXX0XHFP8mjDoTUkKbWCKAN7cnv0bDW+O7qr
        qxxAQKY3OJhu23R3O8F2QREN5U9w3MEcNvzH4OKdYn+j5GANTuQeqAg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
        by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3sqdtj1jf4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 28 Aug 2023 03:52:26 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Mon, 28 Aug
 2023 09:52:24 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Mon, 28 Aug 2023 09:52:24 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B77CD46B;
        Mon, 28 Aug 2023 08:52:24 +0000 (UTC)
Date:   Mon, 28 Aug 2023 08:52:24 +0000
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
CC:     Lee Jones <lee@kernel.org>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        "Geert Uytterhoeven" <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] mfd: madera-i2c: Simplify probe()
Message-ID: <20230828085224.GL103419@ediswmail.ad.cirrus.com>
References: <20230826091751.51634-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230826091751.51634-1-biju.das.jz@bp.renesas.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: neHErvBHZQ431C4VJPNMZ1XQFQbxoP_j
X-Proofpoint-GUID: neHErvBHZQ431C4VJPNMZ1XQFQbxoP_j
X-Proofpoint-Spam-Reason: safe
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Aug 26, 2023 at 10:17:51AM +0100, Biju Das wrote:
> Simplify probe() by replacing of_device_get_match_data() and ID lookup for
> retrieving match data by i2c_get_match_data().
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7218278A851
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Aug 2023 10:55:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbjH1Iy3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Aug 2023 04:54:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229867AbjH1IyK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Aug 2023 04:54:10 -0400
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 211AC102
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Aug 2023 01:54:06 -0700 (PDT)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37S7sDWs012030;
        Mon, 28 Aug 2023 03:53:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=PODMain02222019; bh=vAjenGYdHuZZJEU
        bEUMqaXJbVfF0yeOB5Hz5mpoyvZU=; b=n5x/V91QUPfXV1IPedZDySm41mUtEdQ
        CqzvwcX+pHiHI/lT+wTcUpqOa5NF3ciuJVdjWskWB2oyW4xjNFkW/Ow0CYDUoqeu
        upg4N3yMeRQWbL12CVVKppfsc1dtARcJGaHZmpOxteS7HNL0pEGOP9a6Ob3Ww20M
        vf5TOPkeVMp0s4WHC5L4LN7Ppd240og5KosIJZEpSVBuLCnMGZPuOWexOpJ2OvAC
        4MflN4Ccge8o/GzYBAzjKlSzkS9wqK+byd4YmMXvsUwAkWngTUu3zhz7mZ0XZObM
        Jb2AXhQ4Z4pyBdughDPhU6dyS9gybH94R8yQlaJPz0VjzWHeM1TiG0w==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
        by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3sqdtj1jg1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 28 Aug 2023 03:53:42 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Mon, 28 Aug
 2023 09:53:41 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Mon, 28 Aug 2023 09:53:41 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4BBCB357C;
        Mon, 28 Aug 2023 08:53:41 +0000 (UTC)
Date:   Mon, 28 Aug 2023 08:53:41 +0000
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
CC:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        "Liam Girdwood" <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>,
        "Geert Uytterhoeven" <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] ASoC: wm8580: Simplify probe()
Message-ID: <20230828085341.GN103419@ediswmail.ad.cirrus.com>
References: <20230827102114.55863-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230827102114.55863-1-biju.das.jz@bp.renesas.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: lj7eekS1Xnr-2IXimGnsyfbWHnMSiPRU
X-Proofpoint-GUID: lj7eekS1Xnr-2IXimGnsyfbWHnMSiPRU
X-Proofpoint-Spam-Reason: safe
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Aug 27, 2023 at 11:21:14AM +0100, Biju Das wrote:
> Simplify probe() by replacing of_match_device->i2c_get_match_data() and
> extend matching support for ID table.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93ED9439420
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Oct 2021 12:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbhJYK4B (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Oct 2021 06:56:01 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:46130 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232903AbhJYKz6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Oct 2021 06:55:58 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19P5nh0W025457;
        Mon, 25 Oct 2021 05:53:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=6z+6s7o7bxg/tb0nSDrrdKr95XT+g6aj+Ee8kMOZJko=;
 b=g/i/dZMvd9ry7pbb1bkXXJ/m7J6N2pMlxRVxHEhR7ropUuBy/tIBzgggjjiqqdH4Tlym
 PfHHIMP+ZaRi/iQr6ZdjNK5GWjGMiuXIh9zRkwG5/+Z9ujK1JJNerHxIA76PKdiq5z15
 rjWpzeGQY0gkilhsnSN90OK+wVLcGAbvB+JGbhnme5UdtRgFasHAe5uJ14BRfSzXtF4B
 HW1p1+dir6Evqne1C5s56dYOJw+XPCcsOdLzR+9zHqQcc5TR183h6g4+ue8vuFbL0Ikm
 hOo9/w0VZDxv3t5c5dQXDik0Xdf71IKNwxUEzTZZT4Xmihr2sQ2yATa1vgmonbP4sdLd 5A== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
        by mx0b-001ae601.pphosted.com with ESMTP id 3bwn2mrath-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Mon, 25 Oct 2021 05:53:29 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Mon, 25 Oct
 2021 11:53:27 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Mon, 25 Oct 2021 11:53:27 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A506B11DB;
        Mon, 25 Oct 2021 10:53:27 +0000 (UTC)
Date:   Mon, 25 Oct 2021 10:53:27 +0000
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Adam Ford <aford173@gmail.com>,
        <patches@opensource.cirrus.com>, <alsa-devel@alsa-project.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] ASoC: wm8962: Convert to devm_clk_get_optional()
Message-ID: <20211025105327.GD28292@ediswmail.ad.cirrus.com>
References: <c2a8a1a628804a4439732d02847e25c227083690.1634565564.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c2a8a1a628804a4439732d02847e25c227083690.1634565564.git.geert+renesas@glider.be>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: 5xSA8DGx6tihKfVi-lg-Z1ZYYNDmRXws
X-Proofpoint-ORIG-GUID: 5xSA8DGx6tihKfVi-lg-Z1ZYYNDmRXws
X-Proofpoint-Spam-Reason: safe
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Oct 18, 2021 at 04:01:11PM +0200, Geert Uytterhoeven wrote:
> Use the existing devm_clk_get_optional() helper instead of building a
> similar construct on top of devm_clk_get() that fails to handle all
> errors but -EPROBE_DEFER.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0C8250053C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Apr 2022 06:38:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239829AbiDNElM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Apr 2022 00:41:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239810AbiDNElK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Apr 2022 00:41:10 -0400
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FB324BFFE
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Apr 2022 21:38:44 -0700 (PDT)
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20220414043842epoutp043a79bbb0be22a8bd8c41d823352c865a~lqWyVkH5W3199631996epoutp04Y
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Apr 2022 04:38:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20220414043842epoutp043a79bbb0be22a8bd8c41d823352c865a~lqWyVkH5W3199631996epoutp04Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1649911122;
        bh=6AxAOWQJtmSf2Dkyuii7ac1fCUy9lr8FKSpInhkm3fM=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=bGqtKBsS7/T7lFLNYhconXvNQR2kzhaLS0GnB4j4sy4jv3EzhT3pAxOVBLiKrs5SG
         7DSjHe8YLHCucx6xeVnU3ukaxZS6bC6RMDE0yt5bYOW4VVtZrlxJZizjKekUszX09t
         OMKWU2G+IG8USfcGLMInxJ+UBsX857N4s4pQr1g0=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas5p4.samsung.com (KnoxPortal) with ESMTP id
        20220414043841epcas5p4dcce6e9946823537b33c057ad163fcd8~lqWx2JGf30097600976epcas5p42;
        Thu, 14 Apr 2022 04:38:41 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.181]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4Kf6Cy0Q2Sz4x9Q0; Thu, 14 Apr
        2022 04:38:38 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
        epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
        15.59.12523.B45A7526; Thu, 14 Apr 2022 13:38:36 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
        20220414043835epcas5p12c37c433a6a7835d7524c91d44cd03ea~lqWr3y2h61837918379epcas5p1A;
        Thu, 14 Apr 2022 04:38:35 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220414043835epsmtrp256ad6132f39e7c38232da2e058c4cde0~lqWr22ujf3029430294epsmtrp2J;
        Thu, 14 Apr 2022 04:38:35 +0000 (GMT)
X-AuditID: b6c32a4a-5a1ff700000030eb-d7-6257a54b0435
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        EA.AA.03370.B45A7526; Thu, 14 Apr 2022 13:38:35 +0900 (KST)
Received: from alimakhtar03 (unknown [107.122.12.5]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20220414043833epsmtip27e20228d94cb744adee2cf6635c7700a~lqWqgen0x2896128961epsmtip2f;
        Thu, 14 Apr 2022 04:38:33 +0000 (GMT)
From:   "Alim Akhtar" <alim.akhtar@samsung.com>
To:     "'Yoshihiro Shimoda'" <yoshihiro.shimoda.uh@renesas.com>,
        <avri.altman@wdc.com>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>
Cc:     <jejb@linux.ibm.com>, <martin.petersen@oracle.com>,
        <linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <20220414023115.4190736-3-yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH v2 2/7] ufs: add UFSHCD_QUIRK_BROKEN_64BIT_ADDRESS
Date:   Thu, 14 Apr 2022 10:08:32 +0530
Message-ID: <010e01d84fb9$80891080$819b3180$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJgyUvTt2wt3n6u+7RAigaFBxWiKAHmojQLAn5Inr+rurY5IA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGJsWRmVeSWpSXmKPExsWy7bCmlq7P0vAkg+cLGC1e/rzKZjH/yDlW
        i0U3tjFZvJx1j81i68t3TBbd13ewWSw//o/JonXvEXaLr3s/szlwemxa1cnmMWHRAUaPj09v
        sXh8OzORxePzJjmP9gPdTAFsUdk2GamJKalFCql5yfkpmXnptkrewfHO8aZmBoa6hpYW5koK
        eYm5qbZKLj4Bum6ZOUBXKSmUJeaUAoUCEouLlfTtbIryS0tSFTLyi0tslVILUnIKTAr0ihNz
        i0vz0vXyUkusDA0MjEyBChOyMyZOP8xUcFKw4u418QbGH3xdjJwcEgImEv0TP7F1MXJxCAns
        ZpSYuecRYxcjB5DziVFifRRIjZDAZ0aJr59zQMIg9XensUOU72KUWP3xLiOE85JRomv2PhaQ
        BjYBXYkdi9vAhooINDJKfJg0nRnEYRaYzSjxc9NFJpAqTgEPiUeNvWAdwgJuEr9OrWAHsVkE
        VCX23/kEFucVsJRYcGoLI4QtKHFy5hOwOLOAvMT2t3OYIV5QkPj5dBkriC0i4CQx7/1TVoga
        cYmXR4+A3SohsIVDYvfR50wQDS4Svy8dhGoWlnh1fAs7hC0l8fndXjaIPz0kFv2RgghnSLxd
        vp4RwraXOHBlDgtICbOApsT6XfoQq/gken8/YYLo5JXoaBOCqFaVaH53lQXClpaY2N3NCmF7
        SExYe5ptAqPiLCSPzULy2CwkD8xCWLaAkWUVo2RqQXFuemqxaYFRXmo5PLKT83M3MYITrJbX
        DsaHDz7oHWJk4mA8xCjBwawkwnuzPzxJiDclsbIqtSg/vqg0J7X4EKMpMLQnMkuJJucDU3xe
        SbyhiaWBiZmZmYmlsZmhkjjv6fQNiUIC6YklqdmpqQWpRTB9TBycUg1MStL3XJcdTLt52O6j
        rkXcP8cDZ2IT2JZv1BLLPTA5eP+dJ/Wt/dXlH3iznFRZGv8VC1k9ddfSmLew0/SGGUNqc+iM
        xampvx8yXIsWs9LXnrvb4/MOP83p3fwRxRVlf5XYPrldvcTmmfBZcUWNn0DjfNGJ3tvdBHYG
        Vjw8WWBUV/Up82Wf/CL7M0p7b4nND+Hd1+NluL+2UU9wZnbU+yz1YoNcHtUlDyW3uiRucShy
        XVgaEnB72e/vgffdJtb2SDfyiT/knVS0XF5kIZNuO8O1H5Izni/WW6D+ou5klJSxU5DX13M1
        53Y8eRNVZzGb4+r7hl2mZwoV9JMi3T8/sCxYf16JQ/DuOndjBxvv80osxRmJhlrMRcWJANdu
        wdk5BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIIsWRmVeSWpSXmKPExsWy7bCSvK730vAkg4cXBC1e/rzKZjH/yDlW
        i0U3tjFZvJx1j81i68t3TBbd13ewWSw//o/JonXvEXaLr3s/szlwemxa1cnmMWHRAUaPj09v
        sXh8OzORxePzJjmP9gPdTAFsUVw2Kak5mWWpRfp2CVwZE6cfZio4KVhx95p4A+MPvi5GDg4J
        AROJu9PYuxi5OIQEdjBKrF34l7GLkRMoLi1xfeMEdghbWGLlv+dQRc8ZJb4deMsMkmAT0JXY
        sbiNDSQhItDKKNH8ZgYjiMMsMJ9RYsuuR4wQLVcZJd5ubwCbyyngIfGosZcFxBYWcJP4dWoF
        2A4WAVWJ/Xc+gcV5BSwlFpzawghhC0qcnPmEBeRWZgE9ibaNYGFmAXmJ7W/nMEOcpyDx8+ky
        VhBbRMBJYt77p6wQNeISL48eYZ/AKDwLyaRZCJNmIZk0C0nHAkaWVYySqQXFuem5xYYFRnmp
        5XrFibnFpXnpesn5uZsYwbGmpbWDcc+qD3qHGJk4GA8xSnAwK4nw3uwPTxLiTUmsrEotyo8v
        Ks1JLT7EKM3BoiTOe6HrZLyQQHpiSWp2ampBahFMlomDU6qBadXb3e8/Hz8bYZ4YIb3gu5OP
        I3OUv5ZMuNOhHKXLCetW+khdjjZ8atFxzttH7ylPg8lZhRLRqJ1PRUS+bLvLIhryl2sWX8SW
        PfXfNYpe36pJrQ6dK5y7eIqFfNeJWdL/Q1229O9QvSAQk28XPs08LknJuZ/D/mbdD/vP3bJJ
        H1S4U9x4/3a9jNXVPSKqUrxHRjO8flmB++OfP07zdsu3ris8OztTNOSk31PPF6vTixU3Hypf
        ffFVebmz9sIH5rF3HFTyPl9cxH7Y/Ucf74Lt3711Ywobgy8vv/1iE9f943JyVx9ZJIV9tAsU
        evuzwWW+uC/jYfHnz/MUhQ7Mam8S+Kh41qo9pfPdGs03eg+UWIozEg21mIuKEwHco+neJAMA
        AA==
X-CMS-MailID: 20220414043835epcas5p12c37c433a6a7835d7524c91d44cd03ea
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220414023154epcas5p1ee8179b447bbc1a9d079f58dc6925b7e
References: <20220414023115.4190736-1-yoshihiro.shimoda.uh@renesas.com>
        <CGME20220414023154epcas5p1ee8179b447bbc1a9d079f58dc6925b7e@epcas5p1.samsung.com>
        <20220414023115.4190736-3-yoshihiro.shimoda.uh@renesas.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Yoshihiro

>-----Original Message-----
>From: Yoshihiro Shimoda [mailto:yoshihiro.shimoda.uh@renesas.com]
>Sent: Thursday, April 14, 2022 8:01 AM
>To: alim.akhtar@samsung.com; avri.altman@wdc.com; robh+dt@kernel.org;
>krzk+dt@kernel.org
>Cc: jejb@linux.ibm.com; martin.petersen@oracle.com; linux-
>scsi@vger.kernel.org; devicetree@vger.kernel.org; linux-renesas-
>soc@vger.kernel.org; Yoshihiro Shimoda
><yoshihiro.shimoda.uh@renesas.com>
>Subject: [PATCH v2 2/7] ufs: add UFSHCD_QUIRK_BROKEN_64BIT_ADDRESS
>
>Add UFSHCD_QUIRK_BROKEN_64BIT_ADDRESS for a broken host controller of
>the 64-bit addressing supported capability.
>
A little more details in the commit message will help to understand the
changes more.
Does it mean this HCI has other addressing mode (other than 32 and 64)?
Like a 36bit address? In that case, does Host controller is behind any
IOMMU?


>Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>---
> drivers/scsi/ufs/ufshcd.c | 3 ++-
> drivers/scsi/ufs/ufshcd.h | 6 ++++++
> 2 files changed, 8 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c index
>3f9caafa91bf..a7bb3945c7c6 100644
>--- a/drivers/scsi/ufs/ufshcd.c
>+++ b/drivers/scsi/ufs/ufshcd.c
>@@ -9513,7 +9513,8 @@ EXPORT_SYMBOL_GPL(ufshcd_dealloc_host);
>  */
> static int ufshcd_set_dma_mask(struct ufs_hba *hba)  {
>-	if (hba->capabilities & MASK_64_ADDRESSING_SUPPORT) {
>+	if (!(hba->quirks & UFSHCD_QUIRK_BROKEN_64BIT_ADDRESS) &&
>+	    hba->capabilities & MASK_64_ADDRESSING_SUPPORT) {
> 		if (!dma_set_mask_and_coherent(hba->dev,
>DMA_BIT_MASK(64)))
> 			return 0;
> 	}
>diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h index
>94f545be183a..1745144eb904 100644
>--- a/drivers/scsi/ufs/ufshcd.h
>+++ b/drivers/scsi/ufs/ufshcd.h
>@@ -602,6 +602,12 @@ enum ufshcd_quirks {
> 	 * support physical host configuration.
> 	 */
> 	UFSHCD_QUIRK_SKIP_PH_CONFIGURATION		= 1 << 16,
>+
>+	/*
>+	 * This quirk needs to be enabled if the host controller has
>+	 * 64-bit addressing supported capability but it doesn't work.
>+	 */
>+	UFSHCD_QUIRK_BROKEN_64BIT_ADDRESS		= 1 << 17,
> };
>
> enum ufshcd_caps {
>--
>2.25.1



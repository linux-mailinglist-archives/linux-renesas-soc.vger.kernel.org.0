Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7877854EF48
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jun 2022 04:22:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379760AbiFQCV7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Jun 2022 22:21:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379754AbiFQCV6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Jun 2022 22:21:58 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C075964D09;
        Thu, 16 Jun 2022 19:21:56 -0700 (PDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25H0W1F3005235;
        Fri, 17 Jun 2022 02:21:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2021-07-09;
 bh=EzHUF8ey6N0F7JW+zwYqw3W+IcPMUGcBQ2i4hBobbbI=;
 b=hQA58bFMF1wra2HbPzQnkbe7jOOQZ9UXfdN4PvDJVgexd9Q0geGtGyKa9vIgWUptojQ9
 KakfY9CQlpZYd54fWyK78MzUGDHGBQX6LQJw+Tv/bBipWgvDAwl/8ZA2D5XwLrCSHJ8m
 8tvm9EZx6Gmom1bqftnPxKrkOOJtbJvmEF/OgeaZSK9mDt7ZC1ijDWmrEcw5sPpu07cm
 Ht3DjngMs3I8wb8ssuo3g8Rx/zbjsEr496QXp6SMZHfR6HG/cky5AYCthDCEDM6yGeiR
 V/O6kb6k1CmvrSFIcD9KaeDxU0WW6Io5P8G4WvkutQdHxYsQcHBvFIlZJDW8KF81A+y0 uA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmjnscqr9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 17 Jun 2022 02:21:46 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25H2G6vA029102;
        Fri, 17 Jun 2022 02:21:45 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3gpr27jd9k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 17 Jun 2022 02:21:45 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 25H2LejN040352;
        Fri, 17 Jun 2022 02:21:45 GMT
Received: from ca-mkp.mkp.ca.oracle.com (ca-mkp.ca.oracle.com [10.156.108.201])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3gpr27jd7c-5;
        Fri, 17 Jun 2022 02:21:45 +0000
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
To:     robh+dt@kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        avri.altman@wdc.com, krzk+dt@kernel.org, alim.akhtar@samsung.com
Cc:     "Martin K . Petersen" <martin.petersen@oracle.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-scsi@vger.kernel.org, jejb@linux.ibm.com
Subject: Re: [PATCH v6 0/7] treewide: ufs: Add support for Renesas R-Car UFS controller
Date:   Thu, 16 Jun 2022 22:21:38 -0400
Message-Id: <165543243409.26207.3308107938510478847.b4-ty@oracle.com>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220603110524.1997825-1-yoshihiro.shimoda.uh@renesas.com>
References: <20220603110524.1997825-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5yTx9iAUTu43-yobBSI7rvZfmkIFt-rx
X-Proofpoint-ORIG-GUID: 5yTx9iAUTu43-yobBSI7rvZfmkIFt-rx
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 3 Jun 2022 20:05:17 +0900, Yoshihiro Shimoda wrote:

> This patch series adds support Renesas R-Car S4-8 UFS controller.
> This controller has some restrictions so adds some quirks for it.
> Before using this driver, we have to initialize a clock generator
> on the environment board (named "Spider") by using the commands of
> U-Boot like below:
>  => i2c dev 0
>  => i2c mw 0x6c 0x26 0x05
>  => i2c olen 0x6c 2
>  => i2c mw 0x6c 0x13a 0x86
>  => i2c mw 0x6c 0x268 0x06
>  => i2c mw 0x6c 0x269 0x00
>  => i2c mw 0x6c 0x26a 0x3c
>  => i2c mw 0x6c 0x26b 0x00
>  => i2c mw 0x6c 0x26c 0x06
>  => i2c mw 0x6c 0x26d 0x00
>  => i2c mw 0x6c 0x26e 0x3f
>  => i2c mw 0x6c 0x26f 0x00
> 
> [...]

Applied to 5.20/scsi-queue, thanks!

[1/7] dt-bindings: ufs: Document Renesas R-Car UFS host controller
      https://git.kernel.org/mkp/scsi/c/7522c08d1e55
[2/7] ufs: add UFSHCD_QUIRK_BROKEN_64BIT_ADDRESS
      https://git.kernel.org/mkp/scsi/c/6554400d6f66
[3/7] ufs: add UFSHCD_QUIRK_HIBERN_FASTAUTO
      https://git.kernel.org/mkp/scsi/c/2f11bbc2c7f3
[4/7] scsi: ufs-renesas: Add support for Renesas R-Car UFS controller
      https://git.kernel.org/mkp/scsi/c/d69520288efd
[5/7] scsi: MAINTAINERS: Add maintainer for Renesas UFS driver
      https://git.kernel.org/mkp/scsi/c/09c962fd4816

-- 
Martin K. Petersen	Oracle Linux Engineering

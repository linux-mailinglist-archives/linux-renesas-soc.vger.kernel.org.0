Return-Path: <linux-renesas-soc+bounces-14549-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB49A6644C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 01:56:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E9B8189934A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 00:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 341721494DF;
	Tue, 18 Mar 2025 00:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="e29I0CKx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2E414375D;
	Tue, 18 Mar 2025 00:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742259340; cv=none; b=b3/g8vPCwu1cYxIrUJm8H7xJenwCpkrbpFx+KC3X99c4d6cD3GaQPjgJf7oYoJMB8+BWKHsrN5B7l0/TMnhJXezy4MslYPiGksSFiz7QxnOGAbfR2VYXDKY/S2W63mY1kcxmTZPnMaZsI2+PqWCM6ND+OJP/P/t7+/VhptxArT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742259340; c=relaxed/simple;
	bh=V83iZDIzsqubCagtV6y3O6xgaFF5i/2zrT8P9jcn+CE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DG7+FiNP+UxaPdiUaQ7+sPXDBEVpe8AceQEVt6GAUgxg/A6JQKWew0aFCCzkLl+gDINZQhTlhXOHervEZyiPvite2OB9gse9cs9e/qWZ9cvnGio9YgFz6uMx6nuZOEJ5Os3eLSkbOlgQMUHmOUuMhC+yI2z0gJkUfiUDEVdpwbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=e29I0CKx; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HLtsJE020632;
	Tue, 18 Mar 2025 00:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=WfAO3xCEFpfG4p5Ko0edoiWz9nqD5rTUlpnvgn0beU8=; b=
	e29I0CKxFtBkJpBhz0m50Gm8SMUDVfN8b/ODg3dW41CgsNDZ3Tdr4efk36VVO83N
	ZRmNbIHlmsRyfLJT7jX/bG79znsBdo4HGdr+TIzihDwSHf897zYoubalcAY+F0/c
	FfkST5K5e026pKLy1fvjEzyf5C4j5H41jfKFMnvM9a3+EWKGNjc6y43rLtz0/VCB
	+lF1yxBHtWmdHioHg+0RdmlZ/XQ2a1+Htz0T4MZ8iInFcWRQ/JK2pvopLHc28cq1
	OewoqgzD1NsKKpmGNX12rE8WixPKSQiU0gUYyG7c76k2X91zjupHmE4IJT3+cLfJ
	33klnkK7y371UR81LmJ8Hg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45d1hfv62u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Mar 2025 00:55:14 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52HMXhOC022501;
	Tue, 18 Mar 2025 00:55:13 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45dxeen359-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Mar 2025 00:55:13 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 52I0tCZ8013983;
	Tue, 18 Mar 2025 00:55:12 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 45dxeen34c-1;
	Tue, 18 Mar 2025 00:55:12 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 0/7] scsi: ufs: renesas: Add support for R-Car S4-8 ES1.2
Date: Mon, 17 Mar 2025 20:54:41 -0400
Message-ID: <174225924972.1094535.7000607727357086618.b4-ty@oracle.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1741179611.git.geert+renesas@glider.be>
References: <cover.1741179611.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_10,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 mlxscore=0
 adultscore=0 mlxlogscore=956 spamscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503180004
X-Proofpoint-GUID: s1D90x9vPUBSDquLpMyiNGooysyXDEsT
X-Proofpoint-ORIG-GUID: s1D90x9vPUBSDquLpMyiNGooysyXDEsT

On Wed, 05 Mar 2025 14:34:08 +0100, Geert Uytterhoeven wrote:

> 	Hi all,
> 
> Initialization of the UFS controller on R-Car S4-8 ES1.0 requires only
> static values.  However, other UFS controller variants (R-Car S4-8 ES 1.2)
> require dynamic values, like those obtained from E-FUSE, and downloading
> firmware.
> 
> [...]

Applied to 6.15/scsi-queue, thanks!

[1/7] dt-bindings: ufs: renesas,ufs: Add calibration data
      https://git.kernel.org/mkp/scsi/c/67407b84e0ed
[2/7] scsi: ufs: renesas: Replace init data by init code
      https://git.kernel.org/mkp/scsi/c/c4e83573c3d0
[3/7] scsi: ufs: renesas: Add register read to remove save/set/restore
      https://git.kernel.org/mkp/scsi/c/5129aa627599
[4/7] scsi: ufs: renesas: Remove register control helper function
      https://git.kernel.org/mkp/scsi/c/855bde8ce5bc
[5/7] scsi: ufs: renesas: Refactor 0x10ad/0x10af PHY settings
      https://git.kernel.org/mkp/scsi/c/cca2b807c227
[6/7] scsi: ufs: renesas: Add reusable functions
      https://git.kernel.org/mkp/scsi/c/44ca16f4970e
[7/7] scsi: ufs: renesas: Add initialization code for R-Car S4-8 ES1.2
      https://git.kernel.org/mkp/scsi/c/b3bb1762451a

-- 
Martin K. Petersen	Oracle Linux Engineering


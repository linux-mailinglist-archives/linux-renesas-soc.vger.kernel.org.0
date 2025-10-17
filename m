Return-Path: <linux-renesas-soc+bounces-23267-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CE2BEB5F2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 21:16:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 617506E084C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 19:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED06D33F8B7;
	Fri, 17 Oct 2025 19:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Anm8vNe/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E2933F8A5
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Oct 2025 19:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760728613; cv=none; b=s4I8egSXZ8ik48D2DPfBMhx+ch4A2yHT3lQd8m+9cFCjqv51uwwxXa6rDyGbJjj1r0JxoTH9SFjm2IZPWuPcqr7MGEoOLxoSwnYolPWaZMO50IKnYfjqnFdXNo8qnkB/TL0kbsM/GNT5sNOS2ZiPjgL3UtYdOWaxuV/zZBSi1nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760728613; c=relaxed/simple;
	bh=btZU5MwfaGgYP7/+s6SjyOQuE+97Qee9QTlpd4WyfyM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l62AbSz6CALxfLU7ERDXGo3uvoW5oCjY61XzEcQY0q/Yz33cKjwwNKYIuaeEOvnwP55dFBg38sMV9LiD6sb1xRhCgyRrV610getXt5dkn0r4fxq0w2TSbtmZzekhRi925OeddS9yp1y8LDwQjGOHKB/kMyDr08vORsAT+6JXCA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Anm8vNe/; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HCdhMl030408;
	Fri, 17 Oct 2025 19:16:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=V+icTy3tzcd03YExIPZhZp9rgkUAs
	FIbErp7/q/7OB8=; b=Anm8vNe/XhnAkQ4kDuCxeHdPyftJpIYq9hL6oZ7exX2oV
	JZEqXbYWaU/Vp4D+Z78l16/2coG32Bu5xcW7s7A1HOpXwXFoO0HwLd7tmZsNs2Hu
	1pJJ4q65Ix9ogwmZjF3kHvB2CfeB3yvTdtaFRNg4nBS40GoGcHQqo5KUg5nd5ove
	3Q580FfCEaxvrobbFE420kYqLrqCjoUNDSv8ACowuE8C6ARZpFtQo0gWalel1xTs
	0ResGTK4xoklx23TSSf/17WrMRrdMJZG8Z3ks3bOhkJ7PyPMjshmztTH2fHxte4E
	PfYvVBxp3xhX6q+4hovChoFvg0n0b/RLuMA64iAqQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49qdncbj4a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Oct 2025 19:16:39 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59HHxumo025845;
	Fri, 17 Oct 2025 19:16:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49qdpkg87x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Oct 2025 19:16:38 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 59HJ7xen032553;
	Fri, 17 Oct 2025 19:16:38 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 49qdpkg87a-1;
	Fri, 17 Oct 2025 19:16:37 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: laurent.pinchart+renesas@ideasonboard.com,
        tomi.valkeinen+renesas@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
        geert+renesas@glider.be, magnus.damm@gmail.com,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        alok.a.tiwari@oracle.com
Cc: alok.a.tiwarilinux@gmail.com
Subject: [PATCH next] drm: rcar-du: fix incorrect return in rcar_du_crtc_cleanup()
Date: Fri, 17 Oct 2025 12:16:21 -0700
Message-ID: <20251017191634.1454201-1-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 malwarescore=0 mlxscore=0 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510170146
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAwNiBTYWx0ZWRfXyfUlmv73rWFI
 FLsFVpn/0BP20drFc3uXW37wMwkq/BzKgHpUFHWaBe13woM9ecYZTx4WvXuvghuHNi65YBvZiOD
 Pxx/vHUmxtgsoM2hxz0BbIDP7XkMMKC7LC9zaJ6lhKQeJTMoko99AjJnPtl79wQqTEUV98R15D2
 QCpeoP/025pgpYzd79p8gfOhKuYbYVl9rAY/ntqu7OJEIuXwpdGZkRJ+e5ghMEsCLGoeu/uU9/t
 E/zvQFvngHwsi9TDdAVlGOzs8/IHFXAffo8in/unHdx0v0wkKSIXrnP1OflfLF0eDDwoqkaZ5/i
 vePZi3CZk21ZTUks9pE+2EQ9JfNM5iaHxbd3LUiXAF3A5gAQxxY+fBB0LyYzfOC4m63p1Y496qN
 1EKZm/W4dpTpN4lKh41OrPBvNpTVbxJKevJ0phkjMqMaQBkfnLs=
X-Proofpoint-GUID: -79bYQyYjDcP-3Xy89Za8R8hoOcnIjUv
X-Authority-Analysis: v=2.4 cv=ReCdyltv c=1 sm=1 tr=0 ts=68f29617 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=FgpMwCVgqWoq9Yy4Z-AA:9 cc=ntf awl=host:12091
X-Proofpoint-ORIG-GUID: -79bYQyYjDcP-3Xy89Za8R8hoOcnIjUv

The rcar_du_crtc_cleanup() function has a void return type, but
incorrectly uses a return statement with a call to drm_crtc_cleanup(),
which also returns void.

Remove the return statement to ensure proper function semantics.
No functional change intended.

Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
index 7e175dbfd892..22bcd7db4195 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
@@ -993,7 +993,7 @@ static void rcar_du_crtc_cleanup(struct drm_crtc *crtc)
 
 	rcar_du_crtc_crc_cleanup(rcrtc);
 
-	return drm_crtc_cleanup(crtc);
+	drm_crtc_cleanup(crtc);
 }
 
 static void rcar_du_crtc_reset(struct drm_crtc *crtc)
-- 
2.50.1



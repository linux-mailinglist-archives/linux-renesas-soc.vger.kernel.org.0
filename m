Return-Path: <linux-renesas-soc+bounces-28474-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oL6XHcv0n2kyfAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28474-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Feb 2026 08:22:51 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2121A1CD9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Feb 2026 08:22:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 46E2E3014A09
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Feb 2026 07:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50A2138E11E;
	Thu, 26 Feb 2026 07:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cTwcRpcr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fXTZV3RO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296A0385512
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Feb 2026 07:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772090567; cv=none; b=EhAWtc5IM63HHc0K1IetNah51b1KV7UdCbAzvJEvTCBg61w1DvFyUJE7egNJIyY3ngcQfzv6Du3zm8GFDDXCHWspXhEfukAvYDC65eJh7MvHqiH0dRjH/m+T89yTTemBy8QzMNEqLf/zhum1Z/nF982Nvk+faa3uUNH6ml6RO1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772090567; c=relaxed/simple;
	bh=OHLeAB8c55abfsmY19EJaK81xEkxjGn3FfqX9pxfCS4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Y2E4H1ftKR/2SYtF/OOhZ6Q+zM1wFJn+/52MsnEfoKgGqQE9flOIVXpCsYSnoimq+X/XFkrpI89H39MbIR/75hpvKXDKXGdCcHpn504XGRMgALbQJXdTzNx88lN2I7DkcEpK586nd+nXfe6IfiiJntwz4lRKIAIdFsGGhEBsY4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cTwcRpcr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fXTZV3RO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q4VKts3721822
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Feb 2026 07:22:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WlgdZ5gwHOxelqLHqWLVClyiL1bpxNzwG7E4VVeWOKY=; b=cTwcRpcrZEGp0oce
	KFLyl73ySFlF8BEgTmvsbt6bAS1JK4vl7fRggQP260ktPSnFFtj0RZwzr4m0z/V0
	OW6eZXzFjV1Z/RZH70LZPYmWkRAPyi3p4plnPDv+Z/SpvoU9UqDjkAxrzP3POOef
	5Y6o4ApUWpjvwRhHCrhg7n0GlqIeqy/Qvpo6G4FdcxF+bNsN1WJRuTFn82G3maIu
	F3/R9ZF0C87i6R23zWZwVFM+bv93VqFlbfsQSZkIo8NfVDWly91amUvNswNis9SA
	2gvzzVjqe5mdlCHsT+tASEe4RkgosodWXmGBlozyXGVojgDvANoxxiVpWLaHAC+Q
	g6QJkw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chyvf3avt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Feb 2026 07:22:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae04f5897cso4490665ad.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Feb 2026 23:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772090564; x=1772695364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WlgdZ5gwHOxelqLHqWLVClyiL1bpxNzwG7E4VVeWOKY=;
        b=fXTZV3ROG96qVAOA+MW5hHyahir4V30GKvwp/N1ycajrxmID1VTonbAValMe5GcCvI
         TLYtacEbmZsK1bFZgIEz1IihfECQR4adQZfutgbHiXgVYiEltD5MBsfJnjL0/MA6KTQk
         4gpJI6McUfwFrE+m9NfIsedcdySzM6iwb9uOGf5DIUSLCZDi7CbuYq2Q0Qzs3seuJ1EU
         TUpSnjGNEJKhRP6iRVOwK5sEbGSBWY+N+d417RQHeq0OdxhCPG5nWivIuGQLByz+G1pr
         okT6AnQrA12Itik71Fxk6WPAAoo3bS0m0OWusvCKAOfkiZs+wU4LanudNIvtDpisE4Vm
         YHJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772090564; x=1772695364;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WlgdZ5gwHOxelqLHqWLVClyiL1bpxNzwG7E4VVeWOKY=;
        b=ZPouuRECarZnaMrQX/qDhuG4s6iJXK8tL92d7YZP5XTcVj71WNqxhPJOv5EA3RnqCp
         nb/fsb8cfTAfdjsDPNAZNZEWPfAwqYBte5mCATvZ/bB3SyOjq1+L2OpAjoWmXaGlF2XJ
         6emaruuWPjt4fl/3oR3RSeOoz/YTGAjlM77L8TEeA48WiNN6Ow/h1Pgq6BotbIa63X2o
         ACw+qXA0lfKIhREmLVa1HmtMXV9WAVzOnyCOGVJhOb0+yB6rJTs7nJMTeED3UuB709nC
         addJuNQGr0EkjEp0MSBPEUu3iIIPPvTuhn+nqjMl3Pt+rLfDguidgVPoSGZrTwMnVHJf
         /SBA==
X-Forwarded-Encrypted: i=1; AJvYcCWU7o+gWAJWTYf+mBx/4FjJef8Nk7vZx5cL5NZrNL09N+Bnrs1Nn+9NHnIwBOSoDQ5FTn2CGzemxPUI0ZovO3XMXw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5jcyr3Z5Ai0BCATZVRjbFfAiSKNs4N07UETvukNtPo1/leaNL
	pcFV+ONB7EXXNjNOnZw+RQKfMZohtFiT3oDE/4WN5AaZ38xdGSGiAMTP3zGMq4uZFeKdvI4TxEd
	ives7tcAyTNTqDh4HEWEGYJSvEd1BaNYr8k9gsrCpVGlg+sCaK0FxsUyU/AElkTGTObijjaiwOw
	==
X-Gm-Gg: ATEYQzxeqTyEpl9tgYDb9C8t6GA+OxLZo/rxw6uLKGN4KjQM44C+U0r9ess/6yFfVdx
	gJbZHQ1bzXDqN2DGld+Vd18OZ4orKqtuph6/XwBBzuEZc9kxNvzc0VzqBFkC4cA2OOZvXbfYqvf
	RBX5tr5wNMNEOIirKzxNNUw8skNqyr4I+18EoEiAf9gmZutc+iKEwmY5kHM0+O6HYMneuWCElUI
	2nrvhYhtriosoON9jnxAariYEE2bocGsUkB9jK0oLf/sWprrxolwiZ9WDRWPyXXyyn/guOiHKUv
	wdIIo2aaRLM7brwLCtoSZA2iInui+5exJHg5Y50WkL801aD0XJyp1pUzcQut3763G/jaE3/KMRD
	GspfW3/iyl97lltPx3D7z9k0=
X-Received: by 2002:a17:903:2ecd:b0:2aa:f43d:7c4c with SMTP id d9443c01a7336-2adf78d7941mr17686685ad.9.1772090563833;
        Wed, 25 Feb 2026 23:22:43 -0800 (PST)
X-Received: by 2002:a17:903:2ecd:b0:2aa:f43d:7c4c with SMTP id d9443c01a7336-2adf78d7941mr17686485ad.9.1772090563318;
        Wed, 25 Feb 2026 23:22:43 -0800 (PST)
Received: from [192.168.1.2] ([2401:4900:8fe5:3076:521d:50c0:367d:1d7b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb69f25esm14754535ad.47.2026.02.25.23.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 23:22:42 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: marek.vasut+renesas@gmail.com, yoshihiro.shimoda.uh@renesas.com,
        lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org,
        bhelgaas@google.com, geert+renesas@glider.be, magnus.damm@gmail.com,
        cassel@kernel.org, Koichiro Den <den@valinux.co.jp>
Cc: linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260210160315.2272930-1-den@valinux.co.jp>
References: <20260210160315.2272930-1-den@valinux.co.jp>
Subject: Re: [PATCH v2] PCI: dwc: rcar-gen4-ep: Mark BAR0 and BAR2 as
 Resizable BARs
Message-Id: <177209055853.87053.17849057393556556577.b4-ty@kernel.org>
Date: Thu, 26 Feb 2026 12:52:38 +0530
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: W6gRr6Zs3Xnhfr9JuoDdlGQFFgw5Ms6c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA2NCBTYWx0ZWRfX1bUnIUQwWVas
 UsPdc/LnTNNCiDt5qBqHqWYdiBQJLXyDfPXL1uu4/8LaJUqWyTuAwS7s3NqNcTk1JlVHKiE31fC
 Vhi1rKCOG1FVoxp3DUK7dE/PamPpuVO53p+mQl9kgqOeTlk8In5RqMj0aNxOGKR6/kxQ0x/E9Iv
 qpTsKAgPDPqwY9Db+lk2NrVNf/9ReG8ZAA897Qf+LDjfqqXWkyqwADuBRWFz01WqOllg7eHzSm6
 CVqWW0wpEtzOBD/T12lD7vG+vqW4fOT8/DqbaQ2Qu8DYbz0BXaEIoWB2QmV+plFi1k3dTqPyLiY
 NGLEtUVCkbNv/WLcg8nlRX3RzVqAcmb87dC2Z+lGWzByEOvgIpWn6qj8yDzHdkHbvpMAysGOgkf
 DY3bmgmGOdmvWvUNcOzBMDSBUae1Hbo8d9mtxgwGxbKzq4DYDo6pg9j8N75zqjY6Dk6+C55dDaV
 3dpjpVbsHugTwmAajjQ==
X-Proofpoint-GUID: W6gRr6Zs3Xnhfr9JuoDdlGQFFgw5Ms6c
X-Authority-Analysis: v=2.4 cv=dZWNHHXe c=1 sm=1 tr=0 ts=699ff4c5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=-fu8A8ogDAHwY6WL0e8A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602260064
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28474-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,renesas.com,kernel.org,google.com,glider.be,valinux.co.jp];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1A2121A1CD9
X-Rspamd-Action: no action


On Wed, 11 Feb 2026 01:03:15 +0900, Koichiro Den wrote:
> R-Car Gen4 (S4) implements the PCIe Resizable BAR capability for BAR0 and
> BAR2. Advertise them as BAR_RESIZABLE so EPF-requested BAR sizes are
> reflected to the host.
> 
> 

Applied, thanks!

[1/1] PCI: dwc: rcar-gen4-ep: Mark BAR0 and BAR2 as Resizable BARs
      commit: 7f0031b967fd68a1805a16857f5b3b0ca2d32d42

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>



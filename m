Return-Path: <linux-renesas-soc+bounces-33772-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oWzdHkYzKGoVAAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33772-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 17:37:42 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D21661D92
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 17:37:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=iDiIrBYd;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kgAO5pLn;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33772-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33772-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0B843310F7B4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 15:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 668A03AC0E6;
	Tue,  9 Jun 2026 15:25:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE07383983
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jun 2026 15:25:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781018748; cv=none; b=SP7lWsEBEhXES9gTj54cESbYgxXaMfzx6VXhKq5sR8QPQUY8qbNjrd+cGTzrarCi1kIOszr2dp0QD0QJrEFR/SlPNaCStyJrGMssuwuws3SvNXgnm8aXFe/AKeyQ7ESikTzjxwfzsfuj6QNvf+sHvNFu+9UbuubwYoLDkgio3Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781018748; c=relaxed/simple;
	bh=w1ClKgLhZ2bUXZdj2FMLv/c23L/8Zs6enQ18IQWTTuE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=q/DOeZX2GYr6nB/rvMObZR50WbraJBTipbrjFFNHeaV5b2dcBvwUGcUAMW3WC1Ua93J+sUs2Ls4Jfn1ZRqyyULuW/9+mMllYeJ9HIiduU6xUzzPDH7k+xRU3etjxYDahPg1RHiFS1tiLoFdumeHW6T9fQICrpKn+ycgmwhSobaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iDiIrBYd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kgAO5pLn; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659CmmL72700902
	for <linux-renesas-soc@vger.kernel.org>; Tue, 9 Jun 2026 15:25:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bMJJ/z4tFmq1ROVKLM1UW2J9lXKDuK2hxDYpfB3TmLM=; b=iDiIrBYdlotazEUZ
	OPyfIz2PkBmylecDyPLU/witxmar0q3GzSccaTD+NWakxvgNkbsvsVuse8mbKM55
	JrvpdhjNnxu5vrgjM3o/xKotsYmPQOC694xMre/ZDTukR44deG7U7wv0A1F8FqtD
	6DvzJ1QzQiDLKGPD8/+KvdEpxVz1pwUKFO6yW2PYA4QDUKyMnYwm8jvT/WN7eVPY
	GCAyQHzpLVRnwBL5xfa50FOUNDmOOS4n9TkSLM+VnZcdBQtVrVnFEQwwWD8YbzAH
	CJnrR5NOd2Urbf4Z5OQWk079PAF9gVFuDEIDrRLkCb13gaUKSJsCpuK042RxTnMo
	69cKEg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeeat6n3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Jun 2026 15:25:45 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84256bee9a9so3606542b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Jun 2026 08:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781018745; x=1781623545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bMJJ/z4tFmq1ROVKLM1UW2J9lXKDuK2hxDYpfB3TmLM=;
        b=kgAO5pLnUZ2Tq8BSLT2w3NwZrN2wzhH77x3jTduuqk/ElhtZn5EQK7sikKmund5UHn
         2rbIXta9a/AaWIcXH09jS5UOje+2H+sMphGik//VTMl7D+X18HEGuFMezRDUwnrSB8cy
         CB9cM8zAU6YAeBGpYZPQ5az4/SxL2w6UFpvxALuPp5+6t2zmJAGjZg/RDeBqDZpVv8tI
         N04A1Jsf263SjmNSOnthItYkJgU+Ode3FxGc1YQjxH4HoEdkHlx0ey95bzkKUfl/bLeZ
         jG4PTjoBWz3XmWvoDFJdtKDVIUjlTrjM+H/09nbKcgseM8+sOmO3+JNafsmsnIfuK7tV
         Tatg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781018745; x=1781623545;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bMJJ/z4tFmq1ROVKLM1UW2J9lXKDuK2hxDYpfB3TmLM=;
        b=aP047ZVP+x4YsMsriWQ6cvGduw2SDXy7VrScCJbyU0j4UucPv4A8YY1OV1WNNiKhTf
         fatNMcGi7a3UKj7HqjvFr+ZFB7XdCvtXnGiG9nKvZV0cREiejy06o8e1ouzPlZ40LdAU
         GkKqKabbblJqBxtvj24WP9da5utd6QPT7ePoSQkwWPJKsj2s1t+8LLieuNoXbN4Trjkr
         5iYMi+PTiRFZTPV/PZVNJLzdJCzg3skVjpkoPYxnMAZRBvfbSUPUcY6G0U9qBghnME6N
         fwyMlyAEDl51i6nERa70LFG7Pp+0+OYjLnybNfIIT8VnjwBWIzj5MfURWVreiS4udjDR
         7TWQ==
X-Forwarded-Encrypted: i=1; AFNElJ9AG4sE5xsQ6IcomGQO65vD8OIVo0IbJiim3wtuPQ8kTcx7nqq4pmDIBjsj+yNli8EWQqOkrHJazS63u61cK/euXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRxCdqGMmGAIs0AZpEtdlcr/koJfVT97Pwe/yEwGRp1F814pi2
	m5Gwy77CTRljJI8LULP1znfON7nWeMO8nWTbw28nlEjSQ7zyzj9qypQB0vbExDtIt6msuYoj79d
	q8TlqxPunnaZOR6y9jRSZQGT2kVbzWKsu/QyY0yE469NKbgUjY4a0OzRfKg2Ny7h9ymFqIeBCHQ
	==
X-Gm-Gg: Acq92OFQ6iTPFZOTHKz/rZ2Y+PhSHOBEbawFN7f7VOHzuQRpN/Nxc/mvSlkthcIxjZN
	tw+pKCrkTBDB+kF7NfQmFVeNZxy7FKss9eoBX9Cazgjy7nWq9CDapU40d7t3n4UZVpzl4fNPGn4
	rr2LLeike8GAZu8DKI4Ww9kAeEYiO252N18TTjmSLapnRnEuv0PozyVRs7lyIntXDJqEzMQPwas
	fv69BJp4cD5wPxO/RZaWXv+X7e60W23YgVuiHXnzKMKrsUjAA98tTuqUztoCTHsxv1LVsLSOc7y
	90gH0umTnq22mOoQ7+MvToByaowAR9/qeLw2l9KQP/9wVFJMfWSKrZtWYeJJ2RUWAD40KeSnqv3
	XwKOeNAIgfr0LWxHQI+HjMTEcbxeDHNc=
X-Received: by 2002:a05:6a00:451b:b0:842:7cb7:a3aa with SMTP id d2e1a72fcca58-842b0f86bf0mr20856499b3a.33.1781018744827;
        Tue, 09 Jun 2026 08:25:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:451b:b0:842:7cb7:a3aa with SMTP id d2e1a72fcca58-842b0f86bf0mr20856437b3a.33.1781018743915;
        Tue, 09 Jun 2026 08:25:43 -0700 (PDT)
Received: from [192.168.1.11] ([120.56.203.186])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282880050sm21250746b3a.29.2026.06.09.08.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:25:42 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
        vigneshr@ti.com, jingoohan1@gmail.com, thomas.petazzoni@bootlin.com,
        ryder.lee@mediatek.com, claudiu.beznea.uj@bp.renesas.com,
        mpillai@cadence.com, Hans Zhang <18255117159@163.com>
Cc: robh@kernel.org, s-vadapalli@ti.com, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, claudiu.beznea@tuxon.dev,
        linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260518004246.1384532-1-18255117159@163.com>
References: <20260518004246.1384532-1-18255117159@163.com>
Subject: Re: [PATCH v4 0/7] PCI: Add common helper for 100 ms delay after
 link training
Message-Id: <178101873635.8877.10733384254725006435.b4-ty@kernel.org>
Date: Tue, 09 Jun 2026 20:55:36 +0530
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: isYipKT43yq9gADQu7Ypk4WO1n6cJiD8
X-Authority-Analysis: v=2.4 cv=Iey3n2qa c=1 sm=1 tr=0 ts=6a28307a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=eDurORsI8St+1bJHqsJewQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=snT30zDU7jmJpjBr2YoA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0NiBTYWx0ZWRfXzapu9xLZesdX
 jWCmVcYVgekGalQ0X1dTStW7e0nG6z6A2gqUTdbz4QHgE4LugYasgeGD/6Olrus8/K57oRgirW+
 5oJcd+ArexPRMJYRmqL8TcE6QYEBRHHiwbNM7qGxnf6O8j+p7h4eMPSg+7o4HxxYDeZ+v8MHE04
 WxqBbj2zGwzupLSBP//MPSTZTwnRuISk2sqz7tUyHXivBohQLmTcDFZH+AYbG88GfwyEJ+R2kVT
 XiBoPWI6l+wzi48TlE2aoztWDmzajraUfIcaTg3v64zbjrAnHC+Y1i4FhjOshq7m6G/ZxgesBe6
 pje1WcOakRIVdTvRyc7qkHJFwi4wcTcOnh7ySjUqAf5jvNwglh70WYKryrIMlXGYpSwaIbA1cIv
 Z/ARTXttqYMoL7PqGxBo9DnimLYYkYJvZCFWgEKpVyXVaYyw71KJrBMorniBfjzNMp/U+f5keop
 CJy6TUEwwV+LHjuJwxg==
X-Proofpoint-GUID: isYipKT43yq9gADQu7Ypk4WO1n6cJiD8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090146
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:vigneshr@ti.com,m:jingoohan1@gmail.com,m:thomas.petazzoni@bootlin.com,m:ryder.lee@mediatek.com,m:claudiu.beznea.uj@bp.renesas.com,m:mpillai@cadence.com,m:18255117159@163.com,m:robh@kernel.org,m:s-vadapalli@ti.com,m:linux-omap@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:claudiu.beznea@tuxon.dev,m:linux-mediatek@lists.infradead.org,m:linux-renesas-soc@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[google.com,kernel.org,ti.com,gmail.com,bootlin.com,mediatek.com,bp.renesas.com,cadence.com,163.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33772-lists,linux-renesas-soc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E3D21661D92


On Mon, 18 May 2026 08:42:39 +0800, Hans Zhang wrote:
> PCIe r6.0, sec 6.6.1 (Conventional Reset) requires that for a Downstream
> Port supporting Link speeds greater than 5.0 GT/s, software must wait a
> minimum of 100 ms after Link training completes before sending any
> Configuration Request.
> 
> Several PCIe host controller drivers currently omit this 100 ms delay
> when the negotiated link speed is Gen3 (8 GT/s) or higher. Only the DWC
> driver already implements it. The missing delay can lead to violations
> of the PCIe specification and cause enumeration failures with high-speed
> devices (e.g., NVIDIA RTX5070 GPU, PCIe 5.0 NVMe SSDs).
> 
> [...]

Applied, thanks!

[1/7] PCI: Add pci_host_common_link_train_delay() helper
      commit: 29fbf582e75015c031e7965fdd4084af123b9ca2
[2/7] PCI: cadence: Add post-link delay for LGA and j721e glue driver
      commit: 869317b95fd735684057666a65dd8ef95d4bd669
[3/7] PCI: cadence: HPA: Add post-link delay
      commit: 8dd5d65d0dc750b6890c0102c3992f4cef516196
[4/7] PCI: dwc: Use common pci_host_common_link_train_delay() helper
      commit: 681adc339e4c972b9f7a5ef8c2fb6a2f7737d4db
[5/7] PCI: aardvark: Add 100 ms delay after link training
      commit: 8a602b8bfebbf9a755e8f4732132719a3b298b29
[6/7] PCI: mediatek-gen3: Add 100 ms delay after link up
      commit: 798a96740d61c24f193b82388b681b6a4f102d3b
[7/7] PCI: rzg3s-host: Use common pci_host_common_link_train_delay() helper
      commit: 0ae259d0434bc31fc71696355538fd21027d6ebe

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>



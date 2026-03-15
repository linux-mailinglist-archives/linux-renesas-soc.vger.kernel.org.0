Return-Path: <linux-renesas-soc+bounces-29417-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HZ9I6ngtmn2JwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29417-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Mar 2026 17:39:05 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D682917E9
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Mar 2026 17:39:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92DEA3011BDF
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Mar 2026 16:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7021371D1D;
	Sun, 15 Mar 2026 16:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EALUhEw0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W5eEspe7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A1E369235
	for <linux-renesas-soc@vger.kernel.org>; Sun, 15 Mar 2026 16:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773592742; cv=none; b=QjUTENc0RsOkiZWU/tTzGrnmzDh5Yi1rofKd2OWJIzkxxorOT7GHxJneBp11NB94x2DK0ei7KjjetoLVUoz1TAtbs5SzPZFHGQYbN8ndSINP29rcWhIbsm0NW3DG0Srqf0cTkkhh6VjHTmp2VakYv9X9Sd7rNu+VDmnpircLgoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773592742; c=relaxed/simple;
	bh=N6sWnPVYlkWtJGlhWSZD1h8oJ6vG9zrZFh1ZLS4cIqM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rSpVR84LzB1dmFyHLCd1deRnkdK+ftNGK4gLvMxMLFjhErb0auUZNZYzkrDiTtiJ7H72tS7a1q3EdsAc6sJvupEs/u+METjQQuUZ4c95kF6j3n0IPHqMqLa8U17icwnCtWBYotwRcOo9MxAZ3+k5/SPI0Hvtl2LRdsKfbM7DAqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EALUhEw0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W5eEspe7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62FAx1PV3581714
	for <linux-renesas-soc@vger.kernel.org>; Sun, 15 Mar 2026 16:39:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pagjlBgHRFmM8TNjw/u+wIrjp7WABcDLI8XdmTfMjzc=; b=EALUhEw0aw/16p4Y
	EyHooyKFmsvuX1RXoAFKa98QKult33Jur6ez8ny+4ENwUi67L2XhQ0Pg7QbxvuXA
	FFS63fWdXE4wy4oG26ij5LVkXLjSWnn+H7qqz442ojxLyxceMcxVqvy0Hp5YNqyR
	UBuoDLF9Rrx6GkZmppBJBXLKBtMrZ9MBPVuX4IVzjdB9P2b1PAEURtcGnbzKkujg
	YW+JM6aqP+AdmFylE7V2Hh8ZdJK2nPLYXqCU9Uf+8fMoNXD7Wi8vUKrZmoD0XbMA
	Yq/F7RkQty9EHuHDmDcm55MeGDp7uTUQypv1vL0BEpQy1GX1uPIojhUuOrUysRhA
	zZ4YRg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0udjufh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Sun, 15 Mar 2026 16:39:00 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35842aa350fso27103236a91.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 15 Mar 2026 09:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773592740; x=1774197540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pagjlBgHRFmM8TNjw/u+wIrjp7WABcDLI8XdmTfMjzc=;
        b=W5eEspe7r6Wqm59vE4O+L6kRRf+47aC/tskJTtiVG3lYKYeZYZf/VezcTec060cc36
         wuLOtQ1Q8esuyNTiaIrxl0AQE5BNdSeaPiFTlDZTkkPzkj9KFHOdUNIZUAm8ByWBpH+9
         5MX843bjilNaGSKQy6+bWiqW9lc+N8d5Yaz+a7XQ8WhKMXQwjWnoxHjKd3TmODANDG2P
         E3G554tDYwVa9WvW+jEVzt2ezYOTXYR89f8DJOX8t9sdGbpQJdIntxsuzm8Nse11rY50
         xKpNVFGzWjtXoc/KzzfDfQIgu0Gg+vNn+oh1SfyRqJ5rO61fflwMJnIiZxAawi7o1igK
         33fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773592740; x=1774197540;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pagjlBgHRFmM8TNjw/u+wIrjp7WABcDLI8XdmTfMjzc=;
        b=Qqs1CmkyaM/LLMjc577knzWl5l174l+zeRl3ww3b2V7QFVXEDRvtOJr7/SJXek5vND
         o0VRvTCPYOtjhN/Sfve+Jz0wnjFcK5tajhmo9j5xwwPHcfae7Krt7Y0p276ZSzoLsek9
         qtIB3pP2p6OYt86pZqJs/JuMTmEGUPMBG17m8WF/rnklnj00MWcRGWFO3Vwb2ZKuC5DV
         2o2pkXE7FxUKnDW8csPnWFFL1xEVJ8lnCfKZOMOQY80SQZ1M7KDNkGosmfSwZxdUxOrs
         jGDUM/0pF/KZKTEVNtMWFBjSkQ983kHEFK/aexVz6lHAu9wmTfrdgaHdCaa3zM9c9Hr5
         M9uQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhcSPrKvEqAmot0IhVUIBkMx3vUWw2pp2nfRP3dLq6KInR29y1Jchn2MTeo1kSWpn/aHoEoOfLniDFdxsOIXcDbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyL91MRx9st2aKRwE1NukcyLB8C+9PKXQZxDYv8bHPc+nlikwfV
	ovKTOZllUr42bSEFnz0NJ8b03DU/nyKCCiDlMGqmV0UnX7OmfSJYfHHKiNiaBSDaYpuyJNVDjsn
	dARX/fdGlQIBIAp9/ejK90mwXbq8qhSbapmSy+aa1MWOkecmmThZKcZK1ThpbYztkU4RPi7dnjw
	==
X-Gm-Gg: ATEYQzx0OlGCaWSO0sj0BhiWKkppwS7Lz2r6JjS30unEzQYaZ28SCA2Gz2pipDTjkzh
	ptFepWEBAGmf3Zf3GfK0ECDOP6evRzV3iw6ERTgqnhIAySZ1tMy4qlg4cEbuh1SiB7P2YRg9c2+
	5X8AKFMfxkimhg+4SpmBB0vLzgxndBlTl5Ct8ikv9Kd93VSLaa2dqo2jt7CSixDvLIG9bVubMWv
	ZZ4+umGt/BmfT5WTxNL8Ium5eho4uc4l4ESuJi3WiGUx+NqqZWwZooh50uwpfocZOMKPmIikVbi
	1T2RwsGTRDGMRcWxGb+vpRH/OJOm24LnVlfqv/XM03rFYItkkqIJeTnvr7kmxQA3xFXYZufFDhN
	ovxCKPADbi42FXKmekg==
X-Received: by 2002:a17:90b:1350:b0:359:8de8:1229 with SMTP id 98e67ed59e1d1-35a220032bbmr8989360a91.21.1773592740292;
        Sun, 15 Mar 2026 09:39:00 -0700 (PDT)
X-Received: by 2002:a17:90b:1350:b0:359:8de8:1229 with SMTP id 98e67ed59e1d1-35a220032bbmr8989342a91.21.1773592739685;
        Sun, 15 Mar 2026 09:38:59 -0700 (PDT)
Received: from [172.20.2.66] ([103.69.90.100])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35b92ab7bb7sm2822373a91.16.2026.03.15.09.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 09:38:59 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org,
        kwilczynski@kernel.org, geert+renesas@glider.be, krzk+dt@kernel.org,
        John Madieu <john.madieu.xa@bp.renesas.com>
Cc: robh@kernel.org, bhelgaas@google.com, conor+dt@kernel.org,
        magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
        linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        john.madieu@gmail.com
In-Reply-To: <20260306143423.19562-1-john.madieu.xa@bp.renesas.com>
References: <20260306143423.19562-1-john.madieu.xa@bp.renesas.com>
Subject: Re: (subset) [PATCH v8 00/15] PCI: renesas: Add RZ/G3E PCIe
 controller support
Message-Id: <177359273448.15703.17598535780042580130.b4-ty@kernel.org>
Date: Sun, 15 Mar 2026 22:08:54 +0530
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=BJ2+bVQG c=1 sm=1 tr=0 ts=69b6e0a5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=u/vbNR3bhf5HEmanzZPI/A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=rhLZDS0-Uv6zKdmvx-IA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 4JBYG5GsL0dUt29bgrPNsezlG2GBiLl5
X-Proofpoint-ORIG-GUID: 4JBYG5GsL0dUt29bgrPNsezlG2GBiLl5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE1MDEzMSBTYWx0ZWRfX6qt886qrgCDX
 0Mel/gjQH6jp+VVlBqeCFUMYX9Cs5yibB4TbcYzW/r4Z9lnEoMinBNAeB46EVKbtyUu4GRz4lHk
 yVCcOuQa3sPSNd3VnD+if7OlB/jGCe5+q8xMxQL8SYPPI3fr9fbvGiqB7NQ2AN2hy4BCRmLrSEx
 ahFUsgHXhplx2cHYicznmgmRQTCaHABWery9nD6EAVMpbJ6WcjiGrpG3jDSp+w81HJ7uqtvEuKS
 lHf3q9Up+2K4CcY8ddeBfOOC5C6dfjhq9WVB+2KPQjkV+ecmROatoOSzq/mFtgsv26rdYBZx2AV
 h1ovrte9oBElmdM/HChS8uyU3kGOHj1GqoIdZr1dYWHqmNVfjeoKsVs3MBRGUz7KLGHbGl09VGg
 w4L1Y5NT71KL86K7sZVF+fDxwKNdRcIg4PVzRY1dPmnXGi+GUsQQS6bmu7SRTelpFB2q9jI3XD+
 Q6YC2IZweqSQMg16JOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-15_06,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603150131
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-29417-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,bp.renesas.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E3D682917E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 06 Mar 2026 15:34:07 +0100, John Madieu wrote:
> The Renesas RZ/G3E SoC features a PCIe controller that shares similarities with
> the existing RZ/G3S PCIe controller, but with several key differences.
> This series adds support for the RZ/G3E PCIe controller by extending the existing
> RZ/G3S driver and device tree bindings.
> 
> Key differences between RZ/G3E and RZ/G3S PCIe controllers:
> 
> [...]

Applied, thanks!

[01/15] PCI: rzg3s-host: Fix reset handling in probe error path
        commit: d284389d4576e7c8040dc4cbb66876e539c6d064
[02/15] PCI: rzg3s-host: Reorder reset assertion during suspend
        commit: 34735f63748daa2ea27544259c3042b4948376bf
[03/15] PCI: rzg3s-host: Rework inbound window algorithm for multi-SoC support
        commit: d17a200a747b01e05bb0fc14d62fbb5ad6653869
[05/15] dt-bindings: PCI: renesas,r9a08g045s33-pcie: Fix naming properties
        commit: bb1b0f47f6822864c1689f46348efa42c5d4074c
[06/15] dt-bindings: PCI: renesas,r9a08g045s33-pcie: Document RZ/G3E SoC
        commit: fabce18494e5a4f388c70a40fa8351c911790d8d
[07/15] PCI: rzg3s-host: Make SYSC register offsets SoC-specific
        commit: 346dd3422ed9ff56f033726a50fad2da5677eb12
[08/15] PCI: rzg3s-host: Make configuration reset lines optional
        commit: 4ec4ccdaace40397638c305c0a36b423d2142a93
[09/15] PCI: rzg3s-host: Add SoC-specific configuration and initialization callbacks
        commit: 5f2c4de717786150f8d6cdbdbffb986cd3c59edb
[10/15] PCI: rzg3s-host: Explicitly set class code for RZ/G3E compatibility
        commit: 1e75d2e9a0e018b53f06dcc2e9345ac10f1aa174
[11/15] PCI: rzg3s-host: Add PCIe Gen3 (8.0 GT/s) link speed support
        commit: 5e9a5af5c9a2797a5e41e8ee565ce8108588f956
[12/15] PCI: rzg3s-host: Add support for RZ/G3E PCIe controller
        commit: 8197ec49a2062185f6bd432a19969ce0b3752e94

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>



Return-Path: <linux-renesas-soc+bounces-30390-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGqjAhx/xWnw+QQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30390-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 19:46:52 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5753533A58D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 19:46:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0210230EB0C2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 18:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6280739B495;
	Thu, 26 Mar 2026 18:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ENRwTg0w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PPHXqAny"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A78B348477
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 18:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774549766; cv=none; b=WPzTJSPVveXi9FTa9YG12RBTCmGEvrXjEnZPapM7bpqhvsQGTIfUn/47r5pSku97CTeOtECzIMUPmVE6Fb9OHIlZlR4ZqlIQ/ytdrjSxLlIX25ixJ1IYBcPEx1K75LKIJUQ56UhCdSuUe/+iW/UqG24OZbgQkUXin0XbJGFdErM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774549766; c=relaxed/simple;
	bh=2RnMYeqxbIG3xtIeWfFsB1hg5NMXMzWhzE+LRApt/Y4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hkh4yD1StM6HMfjeTm/QPfWhJNYN11xmwIC4cmGCLteMnyaqAEEU7v3QdoBcG4AfNTFJZAdaiQt8IdMaQiqOX8osUbgmDCnT+8xzjMYL0EbQkr+NoK+MCoDWnnlvtVi0sA+hJePpHWFYDgU2a2cUNttg0ISVEQJaOuwioHOQGYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ENRwTg0w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PPHXqAny; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QF9ekH2450912
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 18:29:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mhld1R/N1HGh4ArMHTWbMovB6Y0to3d0n9zJbwkChvE=; b=ENRwTg0wQgzSXmjb
	Mfte1+W3mldM2W+BFRwd5RobDOHcS6s8+faGOe2/GKEJD9WDyst+D6RhEif5zxkB
	f07S0mjqTvx+yjrj1RV22kPs2lTRdBsFTG8Bm6Flb9AIB6BxNP4kZeg7Mr4CeZiH
	r4AN05B/ZgCQNZqrsF40onb9wXoeab19z7+GnYtCUeQ3/EpHuqsyPDLIY1OTOPwj
	BpPfmU9Z0JNE9EFMybPlewCnDrMBcv008XOVT5vhTlktjiHVgD0LP49Omsr9vvQx
	3060uUgJI8cqVgNyDUGp9xoPwxoOzWirQICEKpKbwV6laGntEqoPrjAQGofLKPqP
	6chb/g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4q1t43ax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 18:29:23 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82c6929bd26so1922555b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 11:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774549763; x=1775154563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mhld1R/N1HGh4ArMHTWbMovB6Y0to3d0n9zJbwkChvE=;
        b=PPHXqAny6U8hgvEK1fVGS1FyMGn3MsbmCwEG0VS770aUO4koYz2PEZs2iaTrZbHES7
         Op9dt7CURpMY/EDzA7ef3W4jxCUWBmxgLltqvk2Tnl9wFdVYd55GYcOvGsblkSm60862
         haxm8KWiYHMM4AQofOuBc7PQg1G7tNf6iPJE+gpQ3QMkvywOl0QGa3IHaAHSLtuypchd
         0cgITdEhrRoK6tfVbWsUGapuzNWJSEBM5+DmOTVHfkuUzKXegMs1kxBRmsDQt1A5VXc4
         z6v3paSH6S2HAhoPGsyKVvh9WXIO/Lq/H53ckU5mXzAEZM32ZxPDB9GVW/T5hG0EenAd
         BAeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774549763; x=1775154563;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mhld1R/N1HGh4ArMHTWbMovB6Y0to3d0n9zJbwkChvE=;
        b=eUZ137MAJUWywotVLUn6VhhZTHuJSICQNKBReIWPcqHCVzarc0RTE8twWd3ogcjqhi
         8CE0m6kTNHrQNbT2KiXsMubpamtDNK3TMH8dNdiVGnr07w0oZ0XLrdcSS5isEpu5FkbR
         sbgILEymBldmarc3wLokhRijJefZ3Ssdet4cPHA+zjwCTpJyAXSj+mQ84mq2LjLaxkux
         YPkxAZtZgHfPjZyG5H6Fy8HvpraLeYls+Alu1oqwkyZWC2vyc6WFzJa2oi3Mj+znoI/b
         EHTrPxcQUzNpDKLmWcL9OXE24tXnKIXwlH1Ko8vgDs3WZwSThGenJA9ImhRxIQkjvCE0
         xi0A==
X-Forwarded-Encrypted: i=1; AJvYcCUouo4X1zenyYAaqF5ykWl+9KgotvQM1lSu4A0Sw/lCR1PmTnSTbPPDVz2pwJNvcFYpK+2xIGBeO06B5ziLQh04gA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmLX4h1tgIS/mU+9V5lGVQKKhVhSQI380kcuf10ZCzRTDVMr1W
	LxN8UHiTHCn/dGXoReNLsRvN+CNYLtTUJFxpHbW+n4R/UFh6NyB64JODiI41Sa9lo7I5ipAtvVV
	BnkYEPK7v4FJRCjqogu1q6wAWoNVt+xVJConKqNHz+cMQAHMai/tWLjN3yeTaywh7ofN32ygl8g
	==
X-Gm-Gg: ATEYQzzTHN974qWzIMHrwVqQ1HjfaCKBU28HeZuoNECKskMj1I0vq5LQQ7hfl49a1bD
	Ok0w8NE7IVN6o4HWY6anGVUQwFrR8dlnROl4y4VvA+wuy2mh+t0tvNB+g1aSyElSLMei3r2Mhao
	YpGXCsBh3eyeyXnwY4GeVhBJnQIxYXEwCdNLQN4eVNj8Wye1pEwVm6NhTCsBt86tYFvV/2H6Jpt
	4ZhTZp6v5M5iFAlhO2wkeYDze355F03uhT0KyHqzJEdupsS7pJhHU4mdp/nb5QlZiWBv/bepR3L
	yhOQfPbTrI6EbLvTiZNXYINTdFrHCaRmSUI3th49S9sroFSiMix5Aj3knEXPFjkksf53odUL1xy
	3tt08p4KECgEh26J8ScRNb90=
X-Received: by 2002:a05:6a00:430b:b0:82a:786f:e39c with SMTP id d2e1a72fcca58-82c6e0da77fmr8829089b3a.47.1774549762472;
        Thu, 26 Mar 2026 11:29:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:430b:b0:82a:786f:e39c with SMTP id d2e1a72fcca58-82c6e0da77fmr8829059b3a.47.1774549761916;
        Thu, 26 Mar 2026 11:29:21 -0700 (PDT)
Received: from [192.168.1.102] ([117.213.101.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d21777asm3568532b3a.18.2026.03.26.11.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 11:29:21 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: lpieralisi@kernel.org, jingoohan1@gmail.com, kwilczynski@kernel.org,
        bhelgaas@google.com, helgaas@kernel.org, florian.fainelli@broadcom.com,
        jim2101024@gmail.com, Hans Zhang <18255117159@163.com>
Cc: robh@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, claudiu.beznea.uj@bp.renesas.com,
        linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-omap@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        shawn.lin@rock-chips.com
In-Reply-To: <20260313165522.123518-1-18255117159@163.com>
References: <20260313165522.123518-1-18255117159@163.com>
Subject: Re: [PATCH v9 0/5] PCI: of: Remove max-link-speed generation
 validation
Message-Id: <177454975543.471319.11131195385745201008.b4-ty@b4>
Date: Thu, 26 Mar 2026 23:59:15 +0530
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Authority-Analysis: v=2.4 cv=e7cLiKp/ c=1 sm=1 tr=0 ts=69c57b03 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=pjPfvbXasfe8cMZvnaMi6g==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=YByT1-VEI5v2HgF6YmoA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: KTMTVDFu8NUg1UPOd1DftNZ4zvKS9D-O
X-Proofpoint-ORIG-GUID: KTMTVDFu8NUg1UPOd1DftNZ4zvKS9D-O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDEzMiBTYWx0ZWRfX2++S4omnE6+C
 y0PCcgHEE+9j/MB2rNg5G9d1dFgW1OMBJzZ3v0Kf1TExDJcZwsDGmB0oUNGunuOe6htqSugiWic
 /UKtr/2ZB5ygjTqROxZ7VPtRY7nzzl9idQmflkEX9v2sLhmmjR8NtKRtBgrQnjQQqeSZ9IzKH74
 QCPBqJxsqv+K0rJWHpUckikZ7Fq7tSs6YzDxT7d/OJ0WZFybAGsggWDaltYVliusOlhOYcpnxnl
 RN7b03+6hqepZ+NA8rcbUl7fTfKW8yjODqIUvtLSJehzvPH4lrH8iJLTBRd6ksUX6SWGVgCktjh
 1zoBbMUMfZlM8xzYwnIJ0kZJsDUkJXGUgVtzqrJpB9501xvhu7G9+4MMw+XEv+Hpsdil7fzRJKG
 3UCheW434O60iOJd3pk8n8ykfm3ZtMwcc6XC8hTqjkmvwTDvIdUP8r9jwQYW/CLswP6E54UcUjU
 pTQ3gs/4K2MBvdPv4JA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_03,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260132
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,google.com,broadcom.com,163.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30390-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5753533A58D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sat, 14 Mar 2026 00:55:17 +0800, Hans Zhang wrote:
> This series moves the validation from the common OF function to the
> individual PCIe controller drivers.  To protect against out-of-bounds
> accesses to the pcie_link_speed[] array, we first introduce a helper
> function pcie_get_link_speed() that safely returns the speed value
> (or PCI_SPEED_UNKNOWN) for a given generation number.
> 
> Then all direct uses of pcie_link_speed[] as an array are converted to
> use the new helper, ensuring that even if an invalid generation number
> reaches those code paths, no out-of-bounds access occurs.
> 
> [...]

Applied, thanks!

[1/5] PCI: Add pcie_get_link_speed() helper for safe array access
      commit: df61f4732adf9de5ad1f5e71b7670710c1597d18
[2/5] PCI: dwc: Use pcie_get_link_speed() helper for safe array access
      commit: d884b0e51459175f17ddc52759ea4533bb752130
[3/5] PCI: j721e: Validate max-link-speed from DT
      commit: 1542ac6d83d0b5706f45e2937de7b4f7b8c4831d
[4/5] PCI: controller: Validate max-link-speed
      commit: d0cc5918a1d539344190cbb19fa3ae0e7b0dca1e
[5/5] PCI: of: Remove max-link-speed generation validation
      commit: 15217c7015c0e1804925693c55d721aad8987e32

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>



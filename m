Return-Path: <linux-renesas-soc+bounces-27547-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCLbMqYTemlS2QEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27547-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 14:48:22 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 313D2A2464
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 14:48:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1E453011BCC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 13:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7695D35F8C1;
	Wed, 28 Jan 2026 13:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q8YXT+Qe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ISFSMnCi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F29354AD0
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jan 2026 13:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769608080; cv=none; b=rYRsOR4zlN94+ANgDRVOGpC0Y6RLC0j/InvXWCdpJ5vq5+TtXxlot3WQpuYnC4dxNo8gs4V29bh12iSjp5zIzfZNTwOPeipcay/ASpQUG81+7+/N7cYW+sTRFv5u0GcRMb1hd4iegctRwS/eS8HS/SwatJHxiyDV4oC3Ef2F2us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769608080; c=relaxed/simple;
	bh=/xpe0WZiMxl/GqX7qwhgJXFWRG2PG+0p92lLjw6JC0w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=M/dpOqaGhJNaVrAVkigwoXiWJHr6NBm/zE834RUND9CCrI80Rik+/bDwXdeNNY2SIIa5dM1ksvlshjEbbas7W7m5Y+wIfPv9mu/xz1kSXWLc51XSzF/YcJiZqTzm5oKdyHdZJQ3S3jBQbj4ETS1NZcP5HIZl8eC65DZjbkXtAwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q8YXT+Qe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ISFSMnCi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S92S4d3907635
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jan 2026 13:47:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wGMo0m1R2L9wwbTRPxCXUEgVOcQ6/Yw3wU/Y91P03Q8=; b=Q8YXT+QeY4P06cQc
	N/4uFGZiGouljnPWHr1Fr80N2Kqf0k01NRQuAeasyWrFpvFyzmVTsMc4hfLHsGjS
	kfY8MdWdpwixcVYhsvoE6Ep5Af5lLrcA1cGYd+LMnvOVUQGEk/czRmf2Q/B0FwRH
	2/daLG1us83CzfFERdEu+40Ibnf2W50lVoPtqVArBInciktD25oQBR3L95U8pGqm
	D67ea37JPV3Cmzggkv0n3HQhYkjW+M29AnE5rPZchNY5DUoeHoCdBv8kAO0MZ4CG
	7mWpd7mI830gRfF4o1taUUhf6H2YBqL4txuVAJKrcCrGFRP5M23b3CiY+Yi08O1e
	oZCHGA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by0g0c1ca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jan 2026 13:47:57 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0a8c465c1so6277055ad.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jan 2026 05:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769608077; x=1770212877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wGMo0m1R2L9wwbTRPxCXUEgVOcQ6/Yw3wU/Y91P03Q8=;
        b=ISFSMnCin7fEsT555OMX+fEgRru+rUNLwkUS6MiqxhBtaLjSbY0bkICQHx8fA7m3Yj
         FpbAeeWKrjen6P35KWgOEyAdgXLD9TRfr3lhSjXdycUffdjOYImQBYf+KQYEVV+cImJ+
         xNyXmG0HZlR/sOaVzYanTcDaeF85kX2KVBTpzjERuKE2XM9ryeDZCkaUWUa0D1gkqPRv
         SxiUBAYFgz8+GbIGx19hQO9hWn8VHmvYvPe9FTw/j7MDZ46qdHvQfN95eiTeJJwXYVvo
         ePas4skvF+w1B2iJzr9s76/2/XHsFTnthr02DyLethWKIUfBuLZTh1SfMeIEmqF8ai6r
         MNQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769608077; x=1770212877;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wGMo0m1R2L9wwbTRPxCXUEgVOcQ6/Yw3wU/Y91P03Q8=;
        b=NQA9DA7PPhfeOq4rxKKA4SLSVyTQzz/r9FiyJ+QI+/6OdWjphvwTeByzrkTp9/79/s
         93UCd/e8cM0+OHgi+N6dI8ucQRUcfSs2/zGMD89FJp7rueYGGdd16TQqZeGrirlLny2/
         9q/uSYoo0lVGxmbnsdzyF1AR69+Su0NZ6uP9zWyLUpbegBrkRgLTIHff3T4kks+26kPN
         BL1s94QBXL80cq9cJFRPfxg5vt8SAV6kwWp78cAh9x/YAsoYNxL5P3KZMl5kni9Uv0Hp
         Ur/ZGcXYkD5wOm3hjnKAAAUGInTQZxEOGit+UvTlTICcvFFBZnVQCi0ghbYt21GgZu6d
         kfZw==
X-Forwarded-Encrypted: i=1; AJvYcCU5N0vmPDBeEnxBcj0jiRZGQrPHZKr4XH+/g6/ljei836BiK/sri1wjQtR7+2K1ZQl763j5pkAjJrC+qdvkUEYGWg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0ZyzOnVUfrC64L7yEqxQfyfUbjEGw4KSXTCrs5j/x53vXIxtl
	g9eP7LKV7LSd8efathWXnOEEQRuLUxcDz2vKKYGR1r2hLLcCrmogKGu5f9M+NgZwZD2pla2Ocs7
	2nBRGHexcM0VDAy9B+P8oZSwncFp2lKR2ysnouQbrnYj6It5QQYS+ZxyJsSa33wrJOynzrolvFw
	==
X-Gm-Gg: AZuq6aLe33tet91W/YxVwhO9+LtPwKA2fp4Enx4dE5r8maILl/gXSXl8nli2Nu4/hsz
	V9fwE/ctF4mc8Zona4XLV57M9w541pDaPCVWwHqja4R5RcAPGy+QNuEd6RuPkB4xGChgqsMpoQ1
	Hrr5nS/9SN+3BN+GqUuECSeFcd7mbLPDBVLaFePTSKr6MgX7IjEDH4N5gKTGepQEYxNkHVwJ9al
	7+Gip7PEvyyRU+X6OoJNrZhCEFZN/cmtSFjFcuOxSeKBUdA3+5FBVcINUooxOXtnfKHhEmX4xXE
	aRlzkW448xeTrltmCbwUd2zi0OahliVForngfQpeL5tv5hXxRnZJ7JQyqT/5h0xqPqZBv32BhFd
	cUU68YxI=
X-Received: by 2002:a17:902:f60b:b0:298:45e5:54a4 with SMTP id d9443c01a7336-2a87120f746mr50143615ad.1.1769608076682;
        Wed, 28 Jan 2026 05:47:56 -0800 (PST)
X-Received: by 2002:a17:902:f60b:b0:298:45e5:54a4 with SMTP id d9443c01a7336-2a87120f746mr50143365ad.1.1769608076044;
        Wed, 28 Jan 2026 05:47:56 -0800 (PST)
Received: from [192.168.1.102] ([120.60.55.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c45c4sm23790595ad.62.2026.01.28.05.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 05:47:55 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: jingoohan1@gmail.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
        robh@kernel.org, bhelgaas@google.com, cassel@kernel.org,
        Frank.Li@nxp.com, Koichiro Den <den@valinux.co.jp>
Cc: vigneshr@ti.com, s-vadapalli@ti.com, hongxing.zhu@nxp.com,
        l.stach@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, minghuan.Lian@nxp.com,
        mingkai.hu@nxp.com, roy.zang@nxp.com, jesper.nilsson@axis.com,
        heiko@sntech.de, srikanth.thokala@intel.com,
        marek.vasut+renesas@gmail.com, yoshihiro.shimoda.uh@renesas.com,
        geert+renesas@glider.be, magnus.damm@gmail.com,
        christian.bruel@foss.st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, hayashi.kunihiko@socionext.com,
        mhiramat@kernel.org, kishon@kernel.org, jirislaby@kernel.org,
        rongqianfeng@vivo.com, 18255117159@163.com, shawn.lin@rock-chips.com,
        nicolas.frattaroli@collabora.com, linux.amoon@gmail.com,
        vidyas@nvidia.com, shuah@kernel.org, linux-omap@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@axis.com,
        linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org,
        linux-kselftest@vger.kernel.org
In-Reply-To: <20260124145012.2794108-1-den@valinux.co.jp>
References: <20260124145012.2794108-1-den@valinux.co.jp>
Subject: Re: [PATCH v10 0/8] PCI: endpoint: BAR subrange mapping support
Message-Id: <176960806032.58847.15614322725355216575.b4-ty@kernel.org>
Date: Wed, 28 Jan 2026 19:17:40 +0530
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: rHH5w2wiBci83mN2lCXN9_8I_bJ7QJWS
X-Proofpoint-GUID: rHH5w2wiBci83mN2lCXN9_8I_bJ7QJWS
X-Authority-Analysis: v=2.4 cv=UPXQ3Sfy c=1 sm=1 tr=0 ts=697a138d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=F3mjE3T3/ow0zpRzCzjSvA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=Ux4BfgyPd-WidXiTcjQA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDExMyBTYWx0ZWRfX6F2kGG8kpWN+
 hgzAfN+g4aeTt2nJ2FK4e8Di1PqS+aKcMGNSFj4nZbsnSp40fX3GCYX2tkers+65zzduG4gNwnk
 ISj8HAWWGl8QcJYTp6bwj/uWbCaxMlWQMu7L5CgHMwhT7/HL4GVTyl3ALhkP3VP+S159PfiFVtX
 mTtG9yBZMbgZMna9WhXk9Xvpu+HGr+T4cPzBWvTxsWI2GSB/feWiU/ifn4b13FOXWB2BGnKgNe+
 GbMDclCp8TIuuGoohdBQGGD2q25YDFyr068VKTUTnHWcDO+8KrGJ+elQ0zDAKkHkAbCoel6BoUU
 2k0Om08peJPYGOhGwCvKlfrEElG/86kg33gDZgQg7uwV1JDHUpGm2FDJ/M9BHzMAkdwvUp6yVP7
 o1Ehs38fP4aGy8zONociiT/SEmEr4z8qmjx+1nW9+c92Iw1iOAtfQMjIJM4NlehEUWbqrqd6G5S
 +ArEFv1Ubo2Kf9GuUkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1011 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280113
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ti.com,nxp.com,pengutronix.de,kernel.org,gmail.com,axis.com,sntech.de,intel.com,renesas.com,glider.be,foss.st.com,nvidia.com,socionext.com,vivo.com,163.com,rock-chips.com,collabora.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org,st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27547-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,google.com,nxp.com,valinux.co.jp];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[55];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 313D2A2464
X-Rspamd-Action: no action


On Sat, 24 Jan 2026 23:50:04 +0900, Koichiro Den wrote:
> This series proposes support for mapping subranges within a PCIe endpoint
> BAR and enables controllers to program inbound address translation for
> those subranges.
> 
> Note: This series is a spin-off from a larger RFC series:
>       https://lore.kernel.org/all/20260118135440.1958279-1-den@valinux.co.jp/
>       The first user is the pci-endpoint-test, and the real user will
>       likely be epf-vntb for Remote eDMA-backed NTB transport, demonstrated
>       in that RFC series.
> 
> [...]

Applied, thanks!

[1/8] PCI: endpoint: Add dynamic_inbound_mapping EPC feature
      commit: 06a81c5940e46cc7bddee28f16bdd29a12a76344
[2/8] PCI: endpoint: Add BAR subrange mapping support
      commit: 31fb95400451040050361e22ff480476964280f0
[3/8] PCI: dwc: Advertise dynamic inbound mapping support
      commit: c0f1506f63546308e894469ceb0f1fadbdf9d2f9
[4/8] PCI: dwc: ep: Support BAR subrange inbound mapping via Address Match Mode iATU
      commit: cfbc98dbf44d52738976f592f30c2ca6bb282939
[5/8] Documentation: PCI: endpoint: Clarify pci_epc_set_bar() usage
      commit: 7d857a3f517df4591d4c85832c4ce5aeb0ddc038
[6/8] PCI: endpoint: pci-epf-test: Add BAR subrange mapping test support
      commit: 530e3701a81b228c369261798ce1b7f63f5d6c08
[7/8] misc: pci_endpoint_test: Add BAR subrange mapping test case
      commit: 622e1ad5e49c6949dd8c97d71f609bd17cfb8813
[8/8] selftests: pci_endpoint: Add BAR subrange mapping test case
      commit: 0ebf8e7943e01b2c38c199228f51adbb89c02425

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>



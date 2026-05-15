Return-Path: <linux-renesas-soc+bounces-32691-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NdiAZBYB2pmzgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32691-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 19:32:00 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AF25552CA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 19:31:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A5D3C301A50D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 17:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 652803D9DC0;
	Fri, 15 May 2026 17:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ReeeR2Kc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A0lNEwjO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455D03D567B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2026 17:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778865345; cv=none; b=VcjY9AQtXZvEw1r59Sva29gmo740P+FPwml2cGGpj3lDXhqeEnq08VFjb4IFJ988ZIvaC6pr45O5JmnNaB9yequuDGu7WU9EArniO64UHRQLgd0XgxMWYmyRK4z4o/C5vRacUQHhIHmyPJxHOwjcPx/6QAX2j7lBux4Rqs3SzAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778865345; c=relaxed/simple;
	bh=9K2h/TOwneDo2V+8IMRKN8704tebpv222lXgzRfs6us=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TDmqtVvd2mOUKdIArVijLVcy3ebXnnsVXv1stXumRwTfw2mdzx3ewb6QWRqhfnB16tes+uK163TqV/lVNr8X4WW7kYIU1PttuOlo1VNtdM3j2DeqIDd/hh5EaWkmBUAukQz7VzGEC90QXcN3R+oStTlV7+wNHP0z9afPKZvQmSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ReeeR2Kc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A0lNEwjO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FGTTds3552458
	for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2026 17:15:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	maIQim2k/5k9GdsUOAUiZ7MicWGQxeUUIRH3OStLOXc=; b=ReeeR2KckqUsYRYr
	S/1Ug2T807YHoA6Yp99lPslIBIv9naTFJYhvbW8EASM6k+YR9m7LJuszIDQUzB23
	IC/Lyr8mi+3t6w/+M233I/o1JPhPSseJ5Si2OgL9ck53j0+9E9fyAg2puI6NpD1t
	0tyELgNbNXjzY1ixYMlapJNsFT6AgU6WuPuMClFvD5ea8ncG93ZZDiLpix1LJN+V
	fT5qrVvm+vAHIMUFrL3d5IIjvpBIa0FALgEFfqRgzJsWDoyu7rIJRFfjjmxwBo5w
	kj1MEo/rkqz2/4MsAoZIyLicdJaiu85ZMyyO7On4buiEvKPtFIC/CJUYaLedcOuh
	sLGHSA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e672984q7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2026 17:15:30 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-365e70c39d0so12777a91.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2026 10:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778865330; x=1779470130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=maIQim2k/5k9GdsUOAUiZ7MicWGQxeUUIRH3OStLOXc=;
        b=A0lNEwjO7+cfnL0EKZ1xu8QNn/EonpGh+2J4dbqO8TOCo7W64BJ02B1i+bTLpeTcYU
         Fi+XQ4CNCxcc+WBQjPXxHaVfkENqAJ9yvMfMW8Sin893TI3ScC/uTRLU/dKj+BpSWHLt
         ChBA6RarpJtDJDuB9scJf1wePqyQ0oz0faKwye2MWjDmRhp+fhkLpAXyZhwMd/rvcxtx
         Ef/8wfiTbG5IfY7pcRPW5nkaizPmI2bkrGLzh1NZB4TWEYHhd2hGBsxN7oRSkxaTR/d6
         rUVKicx/OjC5+AFDy/WYY+fGQLDOgwwLisouDHCwPdFh1ffebwdgdFToFZ9bVLWC59FV
         4law==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778865330; x=1779470130;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=maIQim2k/5k9GdsUOAUiZ7MicWGQxeUUIRH3OStLOXc=;
        b=BKD2quQsAxvfZdEe9GyZCBEBKZoGRkwxb6KorCagznfGqjSjTZ5WVnwbQoLrEEDKys
         2IdBm3Kpgvo2B6WC6lFCC7F9f1BxlqmDz+y9EWhPDxFClwiWeSFxoUrDROtocArmiIR/
         eCGGah6PyobV0bgSzCMFyBvCQGyMriBACLRVY40MoIp0csIZkYeKZKVlw80PvT0Q+BC6
         UzRwcGhZEE/hMjTY3ziE7GWFBx6N1FBtWv1MvSfF4XRySwlQ2rSsZ/iTemJl2rZxussQ
         OMgIkjq2krkzxT5CP1flO3vNRIUtz4GmKBtbW4cTPDB10uTOD2j6J30EWlshWhycWIxY
         /fyw==
X-Gm-Message-State: AOJu0YzEHh39biyO2urjr5/FpPD72hUvs6wEBUSgEfvbrODqLTl+HMPw
	+EI4ykMzamOwKWej78YS5VeSZu/UudlVA/h23j0jTyGVI0DWtHFgygHtv1J1rk/gA77lA1J1a2m
	Jm0+WKGaO2hW3uCXVzv/KsoxcHTZLUb5yBVLKwL2Jv+lExkPHLSpWcqoePGDf1GZJ0UvTDYl8Rg
	==
X-Gm-Gg: Acq92OEgJ6doT0arDXbr3EWYIEoTAfKPkH+k+mwTwUnfv7dFPM5Tz9TU1orRdBaQeKr
	aKPix55XXxsOFVE795k2RR9I7kVoH8uT6vGTQnmul2XRoJQq0CwjSzYIxpbf0n8tkDdr0s2/AF6
	0/ZIXkYR0E2Dn4ebW2s/FjfqD1+e439jMTxkFkshyM2zom6xSdMm49mfIRg2AygRn0aGPRzxoUs
	FmmT1cTrabKCZrQYUERDxSYvSFAIwp7uF5hqRRrXtAFISJRMG1vFMPBgG0mTS4kmeuYDGxA5cJA
	u12s12W/Rqx2yQ1miSHmLHjW5wK+9b32tEJDJUogaZlVavbVv/nWFi30vf6jOEL/x9Yi7PCC3M+
	vVrmEmeBwGBTjpNZ00o7x
X-Received: by 2002:a17:90b:260b:b0:365:f8fc:3846 with SMTP id 98e67ed59e1d1-36951b87209mr5703913a91.22.1778865329652;
        Fri, 15 May 2026 10:15:29 -0700 (PDT)
X-Received: by 2002:a17:90b:260b:b0:365:f8fc:3846 with SMTP id 98e67ed59e1d1-36951b87209mr5703864a91.22.1778865329094;
        Fri, 15 May 2026 10:15:29 -0700 (PDT)
Received: from [192.168.1.11] ([120.60.141.122])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695148c3d7sm4057064a91.14.2026.05.15.10.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 10:15:28 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, linux-pci@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260501102407.29462-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260501102407.29462-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2] dt-bindings: PCI: renesas,r9a08g045-pcie: Add
 RZ/V2N support
Message-Id: <177886532379.11424.6841122855911505844.b4-ty@kernel.org>
Date: Fri, 15 May 2026 22:45:23 +0530
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDE3NSBTYWx0ZWRfX7crxay/00SZ+
 zaeuX25WjEFqRpztel4DSqJyFCwx6a8FHpvrl7UaHB8bVAVIBL3DlYa+yLZg3qOP+gmBclbsgNx
 xC//nLc72w3UkZ7BhRt/MHpMnu8vOWqjEslT0SKkiQ7RqAqvNgleEYBXrQMB5xYnCn9YHP33lc6
 DHbP/m3wIWnviA6zUwzPrlLAxOWKNR5LDGz7Kz3Fj3uCZI3Xi/FnLTilwxrDJ8pz/goUzL4edMA
 3VdyC7YaOGBChtVGW1IC4SO5jqLXxAyfqPhC8aIvxDbI4eXP+8JDWnPr8RvU9ui0zl5MqfS7NBb
 cQfAVFPIUHfoGjXqMCG17uO2+c39vUokz5lGEBHRwBWIzwnsF5hBX2BjMzgOJ36rNCz17OaVB+S
 sXvrNNIu8FsZZxi/9jF97tAG4Ah6He7KFWd0ylYr1HdlDlou6PJPM5k2SU10BLBPq2W03COPifd
 /C8mVw7GNckRmEp09gQ==
X-Authority-Analysis: v=2.4 cv=boZ8wkai c=1 sm=1 tr=0 ts=6a0754b2 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=8TBCxnFsifAbGBbxUCxq8g==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=nEI45t7MqVOh0zsBhjcA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: k62vM7mL1gd_aBLU--Vs7YW3pJ0fGCj4
X-Proofpoint-ORIG-GUID: k62vM7mL1gd_aBLU--Vs7YW3pJ0fGCj4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150175
X-Rspamd-Queue-Id: 00AF25552CA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32691-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[bp.renesas.com,kernel.org,google.com,glider.be,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On Fri, 01 May 2026 11:24:07 +0100, Prabhakar wrote:
> Document the Renesas RZ/V2N PCIe host controller, which is compatible with
> the RZ/G3E PCIe IP and therefore uses it as a fallback compatible. The
> only difference is that it uses device ID 0x003B.
> 
> Make the binding title generic to avoid extending the title for each new
> SoC, and update the description to list the supported SoCs and their
> capabilities.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: PCI: renesas,r9a08g045-pcie: Add RZ/V2N support
      commit: d2fc550dfe13eef91b065af7a12348ba4162ac04

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>



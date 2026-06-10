Return-Path: <linux-renesas-soc+bounces-33838-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4MFdICmXKWr3aAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33838-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 18:56:09 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C1066BBB8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 18:56:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=A4xagzc9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iJXRGNdy;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33838-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33838-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CE7003001192
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 16:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C07EB3403F3;
	Wed, 10 Jun 2026 16:37:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB4333D6EE
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jun 2026 16:37:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781109456; cv=none; b=hzMSKDzjAiqjtDpA/BX0XOeulP5yeCCpvuFIAdyA6P3LUMuBuOjiwgfToKI1t1Q9oZk/H+ovYvoWZnV3kArmomO8+jge5CuOb+vElsNPIwS/BQVfGlNzrW7mvNsgSKuUAVYOWKSKFyOfR8yf5+Y2/Otii5GESUANoaDLA0mRZU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781109456; c=relaxed/simple;
	bh=ENNw7YEAGnc/LAU84JitTes1YFDalSce2sLjj833HZ0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=e6Df0TcwPRLsu+s1ZegztMwm13SWDj7K61FNgm96LA20t7W8oeA1kLzArShvumOVaFC2YtBDq00pruM3/5B5+hRxdJ2J0lPzP1Qrldrw/BDccW5Y0T/VwYY+PQv9xbVlAamOtiWGYQLcfSAEBcbs0aLIO/IrMvsPzV+YW0q7Geo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A4xagzc9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iJXRGNdy; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65AFxKkQ1670940
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jun 2026 16:37:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S8RdfqWX6fIqgJGJX0i1xNJBu3AEuSVVWlXThSE8IHo=; b=A4xagzc9pvh6b6XR
	u8a82yCMorY4laHnLkyefbMSHAgI2dTzEEI6FamfpOhS6YJSmPvP9LiwQoCcxe4z
	QNCn2FGPbBGlpIyrwusjhBYj6q0dO6GIBcuVxqFAs/znTE3BBx07CwD7tFcdBdY6
	FznLzw0PmIx/tXAwwxdM9d8dQKvlKAOMdk8gypZXTJOZIKRx9O1EeBQR9olLF8MB
	MjQbMUYG1CwFejfTRvfG63bPXhH4LRtlwp+qvsfQSJrUUBKFGNIqhGOcCqOHeu6I
	/jlQ3LWwvOCtb+WKgLSlFKPEgbcOnNSQQ9qHL3Af0ml1UZta7yTTdHoReWSjQJ2A
	tCXftw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0m1twwb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jun 2026 16:37:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf32fb7cb2so50140565ad.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jun 2026 09:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781109454; x=1781714254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S8RdfqWX6fIqgJGJX0i1xNJBu3AEuSVVWlXThSE8IHo=;
        b=iJXRGNdy+e/e21eX6vk/65jA1nNfXoJaN99dxOGXOccCktMCXqhnnk10lK1V2iiRk6
         d4S+Ad2O3oafeWpMvCngdtw1hUrUCV2x7btEMru9CE+sfDGNiAxTgD1wQga7kn1DYxNu
         2j5bURAm1lohfUqwkZfLAGJk1Y+O4/B9WQ6mIBaV4uNHjcZV5S7tbH21U770iiEQ8PeO
         apVb3mYpOEm68McnHZeJqo006fQHqo8AzInNI97kOwhdAwtimv+8vmUtqmH9aoEHk4nH
         ek+6P8D3znzN8YSBSC2pnNQ7kTlQNljDQbbwsaztxJhR89wvE6DHQwPdehpEiyk4ngWx
         e8iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781109454; x=1781714254;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S8RdfqWX6fIqgJGJX0i1xNJBu3AEuSVVWlXThSE8IHo=;
        b=FYgDRalbpVBP3Fte13ISVt94RihlBG7e0lKcuBIWi/2aug3WeRJBeLo3wuAi+eua30
         EhEseQsjOSSq2FfVq4s0XMaf4aT60QhK6vLvG9WmMN9sWd9opRwJfyLVR4ia8Fi5itpF
         WAMd429yKNbldvo0X8MxBeJbtHjtICX6xxkPJMXiUvEKBTQ6AGEshC5qZcKKd0XaYL0z
         QlB5Lvs5bvIBAQC2qi7T+ecQVPOQyUV5Rw4ZelHnt70aipx74UCvNXQSaCxyOW7OpgE+
         e1DwNgX7rfdqqfkjKaAiMiJZMNq20vqpHWw15iWleVhgWy1HKOsl7WqWy/lPcLhq+khI
         hpdQ==
X-Forwarded-Encrypted: i=1; AFNElJ+PnV56HWeK231M5Grismg/G7EdDR9lYEyVvQntzeRiQLLyXsb6475p5OuCchHlxbqEjROr9dNwpupu4mRoEcp6Bw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLta5y12hCuIkNSMuPuxas+UZz7bFUSxP/4fSRIF9Wpv6ewGE4
	twfI/+1S8jSgOnjrE7bKsGBOAjv95FAKKN2SHIvbpLLFUe2YgFKrnzRyvugVCyzcNpsqmP6P4fi
	JZvRVhcMa10QEfNU5WLH5tiI0U9ZUkyhAh68Fle9bqL7Xo3aXZ16qGwe2nutlS7lik7UfyiIeBg
	==
X-Gm-Gg: Acq92OHMNbEmIwbF4B/nMm/Y6tVnHzw7ANYB74ShjEBS2lQWlhkmvhHYFtThN9OB7Xz
	tePw9lQqYPioX8uT9oX2KPfbRnbbsRmLVltmcMj3FyLbSN5FQtDN9GlaMVuixKSvJvjhCU4oXjw
	FqbBQ4Pgh2QojeoUknwbjBt+d9JUb0/zXi52s3yUgKhpdlrFzQv/qJozpfwR8Qgxt3W2Ov5FN/5
	AJV8Nm/BFqQiqKxf3q5o+kJFNVKFBqNuqaHryFEQ6UQbUekz7WJfoTZXtXpi4q2Vvsdwfq/Ft3+
	cLocDaAzatMJGtjLbN0tydBtsg4PgqgIFxPmksfS5cERMEHJA/z98+ohlDDAg5aSl35VDjGmz3C
	mYBRvl7LeZg62OnTqvNRkyHCEEP01jCo=
X-Received: by 2002:a17:902:f606:b0:2bf:9760:b963 with SMTP id d9443c01a7336-2c1e810e153mr300902405ad.26.1781109454147;
        Wed, 10 Jun 2026 09:37:34 -0700 (PDT)
X-Received: by 2002:a17:902:f606:b0:2bf:9760:b963 with SMTP id d9443c01a7336-2c1e810e153mr300902105ad.26.1781109453617;
        Wed, 10 Jun 2026 09:37:33 -0700 (PDT)
Received: from [192.168.1.11] ([120.56.195.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1664a67b0sm255605665ad.80.2026.06.10.09.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 09:37:33 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260521091256.15737-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260521091256.15737-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2] PCI: rcar-host: Remove unused LIST_HEAD(res)
Message-Id: <178110944858.12000.2016000239061925100.b4-ty@kernel.org>
Date: Wed, 10 Jun 2026 22:07:28 +0530
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDE1NiBTYWx0ZWRfX0XOMOJfXEO9D
 20xsNp51B9g6bOrjYPRNDcH/SwdOyGdd0BAi9GbefPwrFJJXfzO7g63J3G7MSCLK2T+WqNGuxGw
 fDCK6e+RvDsamcGXodzOJWwwhV8mfB5G511mYoQxGRsvAFQFhs14r8sQK4+Am5AuADHhQQx3bPS
 MihNtHXjmgm66GUnZ+y0i/VpwkaZsD3+PATGaZhH2D1enx2N+2TfQojNDSqNbyAw6lpT6KB6Lzh
 xtL1DcrtEsS2PJP/P7ddX+jIB2P6/t06wqorVdx6dkHxPwaAwfABvlA4LX74CNKm4rzzBTy+IYc
 tvG7SwAP7OcMGEfGho50ARtcZXazeh461wlt715IF1DjgEGGpnmcdvJFs47yiKJKG2EhMUaf3Q2
 vAQ7wxKJHkCU5mx9RUpJgb7Qov4LBlRMCOLlSTRB2VYvmr4ME1pHVFDCK3/nReGLl2MNVxAioTL
 mHTOYYZzRP9Rp+v6BPA==
X-Proofpoint-GUID: DBdO4Jchjt3sY0iT37caen1WBHfqd3S_
X-Authority-Analysis: v=2.4 cv=UdJhjqSN c=1 sm=1 tr=0 ts=6a2992ce cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=n8UK4BQKCdfH/t0JQ2luxA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=0bM4ZPZhBOE8UCOzjv4A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: DBdO4Jchjt3sY0iT37caen1WBHfqd3S_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100156
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut+renesas@mailbox.org,m:yoshihiro.shimoda.uh@renesas.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:prabhakar.csengg@gmail.com,m:linux-pci@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:marek.vasut@mailbox.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[mailbox.org,renesas.com,kernel.org,google.com,glider.be,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33838-lists,linux-renesas-soc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 66C1066BBB8


On Thu, 21 May 2026 10:12:56 +0100, Prabhakar wrote:
> Remove the unused LIST_HEAD(res) declaration from rcar_pcie_hw_enable().
> 
> The macro instantiation defines an unused 'struct list_head res' variable,
> which conflicts with a valid resource loop-local 'struct resource *res'
> declaration further down in the function, triggering a compiler variable
> shadowing warning:
> 
> [...]

Applied, thanks!

[1/1] PCI: rcar-host: Remove unused LIST_HEAD(res)
      commit: 6ba90ce2069ae923b0ec787aebdf2d786e5d2a58

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>



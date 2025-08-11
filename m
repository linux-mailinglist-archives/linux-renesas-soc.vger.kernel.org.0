Return-Path: <linux-renesas-soc+bounces-20223-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 196F8B205C9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Aug 2025 12:38:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C1A4425187
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Aug 2025 10:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5BC723BD01;
	Mon, 11 Aug 2025 10:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S5ddSIAj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F385A22FF2D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Aug 2025 10:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754908681; cv=none; b=CkylgU5zVEtlpWuawDT9L9k2oOLGoqsdOr59keqN9EVArbNDeMRkrlkdgWwdR3kf+DerxP8ogq3nGHrmhvgYUGMJu8EjCtWqMoPGyS+6T70ZEDXEULsRfJVHW7IaTQc9RYvHNvFizkgLGh/TyCj5mXi7tTUsIRmAXjfemIPj67o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754908681; c=relaxed/simple;
	bh=KTA+LXFcxm8rSp9NxBybqhYS35EsghTwK6KMNtuOQOI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jxbgHzDxqoSj+R+lXsdlWVCbDi8bE2WZI95RoXoq45U/7aDe8T5dlhHress3IAyp2S6Lp+yO3L2+aOXbPrke8QrG1yCeTDO9VQPVx/tho6cfaIV4oVEgqOHpYOXhnxXGeVQe88Dgl813iUWoHgrltJCWiu8R2Pb8ez+Nbj8Vbt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S5ddSIAj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9d8Yt019037
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Aug 2025 10:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z3igM380Sl/mCHIaNQCGmITwSXOBNYs11tQRbhvnUek=; b=S5ddSIAja/HmRPvv
	wEdLE5bOOr/JOK0h6GpfDvdM2/kZ5LjJgp1DzU/9AHlcp/6TIWF47VixlMtGva+S
	GFBAbSXucMQ/IUB6zt04Epg0yk0V8vgHQXwAFnwuMHVK0GABUHML4QiU3M87r95h
	E+4NGc2BnSZD6w35GiW1G4sxBNtsU9vLp3MLr7IS/jj6im0/xPWVhqfihJV7wq+E
	IKFLKnTTrxsZi8fSuyjKiBmOFhBO2ivmxGcd1YmdIOwlDRD8bYQXo3JN5ue2GAOH
	9JQWudEF45gpDBR97CMcTrWENQQAW9xXwQJYENjoZ9LfOK2CZ59XBXUXCM24s3kd
	mSiVYQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxduv0xq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Aug 2025 10:37:58 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b3510c0cfc7so3191846a12.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Aug 2025 03:37:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754908678; x=1755513478;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z3igM380Sl/mCHIaNQCGmITwSXOBNYs11tQRbhvnUek=;
        b=nw3YgYTQLQwbq1pYwH//DvCqzXFDap4sPU8Ydwj/pIHvcaX9NuQDvcF6fxfqPhEbw7
         +KWxLtLXA1ZYAJj4LdLh7x/ViIEKc3cPMcu1Pf4O1ORih0dL/PqkOjS5YrrOA+X+Y6xT
         RjQETYE+QdOgGpoI3Urh2g/39Gb6rqJuHXv3G7m8Gg5Kti+lHNAOCkqX7BahMO43gwjg
         qR4ED+tVYidf8psS4YfBFlZ5Xw1p0EuJM0H0gMDD9O33WEv7C11b6Pd0NhR1wNNrqLk0
         yRuGDAvf1V8pQh6k/XX92HkLDNQwzOH0Fi4yyc/SvVy/9mmTb6RX9pc7Jqg5XSKJS5oA
         S7cA==
X-Forwarded-Encrypted: i=1; AJvYcCWNXS2ITPMq1mk/Q/KWTMaJusmXvr+SNqmjJl56DvT0mXILKuZVCGCHDaM5lgAV09UANsXr9qNGZddH1n6OXrLcLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzF5RDDLHTW3oFV6sYKr2VNsQWV06kzOwvWj46VcwPhf017R+h+
	BXJOIrbMH87guHc744S4VU5u21F0CCnW01uI3pU5p4C/OGgFWeoWEx7tTkSGsdzgTXUbAGvFe3h
	ntXW+AmgmiQXg9CtH9wMD5eSUDaq3WxBSu/eqw9gHOGf/kIfK0bL5lbrKyjalC5xo1kseKvFxJA
	==
X-Gm-Gg: ASbGncsJ/235lvM2fgcH5KYGXt//fzkWhAqzYwnmahB2Vhxab3iAz37dL9ouTOYNGBg
	D7vmf0XVsLtFFGkGGyVQ9THFlOOJ1F1aLogXqKatI9YgQopN3h00CblYvDhnAMVLvd4++8UXZ7w
	lmLqqfNRLL/0Efs6hXwznsMyKI8odJaMyIuCwOE2Jz1Le7r1dbgr+dga1OX3qUNxysQM1meCc6S
	x3VpyxIZEDfJy29UaTe5bWy6OZiM3Ni8qSREAmcgaQprYZz7Js+1umtXTWs0mtD+Z7lVmlMRk8v
	9A5vkPqz27lTN+Z+w9+3i44T342tCrDu6qpAUjZy
X-Received: by 2002:a05:6a20:734f:b0:23f:f934:19b9 with SMTP id adf61e73a8af0-2405504cb40mr20245809637.14.1754908677699;
        Mon, 11 Aug 2025 03:37:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCXTHsPg/7tVovNsk+VII5GuETNkYA1CNQuye0xMFRhATsoq+G9PvJ8YJ7dC9er9GV1cVQNg==
X-Received: by 2002:a05:6a20:734f:b0:23f:f934:19b9 with SMTP id adf61e73a8af0-2405504cb40mr20245777637.14.1754908677282;
        Mon, 11 Aug 2025 03:37:57 -0700 (PDT)
Received: from [192.168.68.106] ([36.255.17.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76c61705bd7sm5516251b3a.31.2025.08.11.03.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:37:56 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: linux-pci@vger.kernel.org, Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: stable@vger.kernel.org,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org
In-Reply-To: <20250806192548.133140-1-marek.vasut+renesas@mailbox.org>
References: <20250806192548.133140-1-marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH] PCI: rcar-gen4: Fix PHY initialization
Message-Id: <175490867407.9732.16514793693327960028.b4-ty@kernel.org>
Date: Mon, 11 Aug 2025 16:07:54 +0530
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=6899c806 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=tivzXH558BYE5qsfyb1zSA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=GvldxTfKssXe8XXbSUYA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: TRyDgz0ffnxm4DgFf2-XmCxlsKlY8qTe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX7FRx5tqn2gOm
 AdZ34fhu2IDRxP8qSnRpkoVLK+oQNW+zl2GJgU+7d5jer+0Mltdp6AIiGAPA503tUbNEFiDgR1V
 7k7eG2wADsctekt1c8RaDxnyeq8jWVrmhm7uOpOpHiuAek5x8v+SwlQESBhZSErFJcgWJkVUgsp
 pdjakmDJIf2W1SenpHrHdc9sbMRa4Egp2xbvj7HqDiKd7vfzl/OZMIAeWwzla6iwf+3GRzYo9UG
 jJqBC5iK4m4fhvCPm3V3y4mXBaSzvKgdNCh/y3dxfaKc3FzZK+u3OUNlcvpezRgtub5Q5cVlMm6
 JCsR+cdxLsyisi7YIqKzZASQmJEQzm2hrtN/m+wPeMtJRJqGICf/xOi3rfgeH3uXifvoOaDVZZd
 Tc0ufZGu
X-Proofpoint-GUID: TRyDgz0ffnxm4DgFf2-XmCxlsKlY8qTe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1011 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025


On Wed, 06 Aug 2025 21:25:18 +0200, Marek Vasut wrote:
> R-Car V4H Reference Manual R19UH0186EJ0130 Rev.1.30 Apr. 21, 2025
> page 4581 Figure 104.3b Initial Setting of PCIEC(example) middle
> of the figure indicates that fourth write into register 0x148 [2:0]
> is 0x3 or GENMASK(1, 0). The current code writes GENMASK(11, 0)
> which is a typo. Fix the typo.
> 
> 
> [...]

Applied, thanks!

[1/1] PCI: rcar-gen4: Fix PHY initialization
      commit: d96ac5bdc52b271b4f8ac0670a203913666b8758

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>



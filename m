Return-Path: <linux-renesas-soc+bounces-25095-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B90C8368F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 06:52:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B4FEE34AD51
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 05:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EF0A283FF4;
	Tue, 25 Nov 2025 05:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GybhLeGN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PMDgJDyw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54E01E505
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 05:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764049969; cv=none; b=LRXgpxxf/dea6yo6WY/NpKBJthzKaqHHOtzwMSiVdatp3St4ACucWaVaJsH0HfFuKY8gRXWJwbS5h1DwFHqLHidjec3iF3pRQhs0SA1VTGHdTzjAb3odOE+ftpcrO8iH1xgKkG8RduKgen2g+GbjCGp8vafzPCVquJloD9qSn8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764049969; c=relaxed/simple;
	bh=ZIIzYnv4Q5BekNkR9egX4PMB0Q4mnckLxIhWYuoDy7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dYoXQTIjXM8dsx/e5hDZWEdOmCTm/Ciy0G/bsHk1JtEC9c3vhvx1M9o3yyKFUxEW9Yp9qMY7Pf+5zLtUwUPSn+He4eiyHGNCmrqc2bUhE7fyMqv6vwASThxGAtesVol0vxLkruMhTNY3hQVdyHODn+UHEEevqhJn2Ln2MESo0nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GybhLeGN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PMDgJDyw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP2gnrT1741250
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 05:52:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	404nClmNRmrTW1zYFRsUIzncgU8WOWDCjaNO2hfY0lo=; b=GybhLeGNown36iC1
	S4bsjg/ZywuYGDrpHnYtsWpKMZUfHhWDOl1fzMjH+yZ2LFHIznQyY3p2oc9msxRP
	irYebswsgp+w9+SyN0bR5x1avvIjCifs/IVnmUQPwPVI8cqtL9pgs1GY2djwnyQZ
	4C1nZJr6jUsTV/+DgcjOnQfOmGYdqh4IAkHj61XYFsYQlSlm5ltuVos01VDo6sjR
	oNnpoWRdvIfhFpQc6KsQAWVcqmB8gZIBR9ZiGJ2ffBbemLkQgwmMtYs6H7DMXtIP
	c21GGsLdxpwWCtyzoZY0hgh6mNd9pCPufjpNBR1AWSX/yu/qLUgbmX/VceJe6Tur
	PWf3Mg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amteba2rx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 05:52:46 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-297e5a18652so57529525ad.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 21:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764049966; x=1764654766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=404nClmNRmrTW1zYFRsUIzncgU8WOWDCjaNO2hfY0lo=;
        b=PMDgJDywtm/IiRc1QuLPoFCpk9AFenHB0SFxR8iZbg2vr0rYgfNy4/ihD3QW1Bmt1z
         PptajVQYsQ3jfPwHHQqlQxM6ZueDr1tk4sIuwi98UdlcdvF+S7YGHHbA4JZFKXABE3qB
         gg6mVtcBFn41gkFu9wHnSw+qUUQZ8V2/pvZu0pzDSap6+fG7r0IMb317/Kx9uGls5lRd
         YSW3OEVgvOn6qvgJ+flImvgUp2h5YHrHulOc7S1M4naaUii2jYBzLU0xVkZCipXn47P2
         zbgsHJWM+wg/ch2bQL1Gre4XspQDc1soBCE4R8E/ePcqB0TlAODegzY4OThjlCjrE/A8
         pPOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764049966; x=1764654766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=404nClmNRmrTW1zYFRsUIzncgU8WOWDCjaNO2hfY0lo=;
        b=fzz0i511mNBKNmUWrVzUvETZeD6KKjJ0y0K/AQsfpiYlecRUNm8BlWrS7wkVwF2Xg7
         qLAjYahh2YsEbM8/tZGJnsC5MZu5ij8MW5HUJqcjko56VtqI93Vf0cvRn4vMp0PsyF31
         9tBvfAMjBZJyy7URyD5UyzglMsiaF5D/MgPvG9xOM6U9Thmfb2TKtpjWQaMLV0D5Ru0K
         Qq4uMsrsOq8GcbOAegZ04qzKqyGsZMwrMIml6o3L16qhEUvDnMyU1armZGvne6jEwGpy
         UZMCAUB+pulncHtByknDLb4+AXiaeqYVg7CUqCKMfj5DfB1rX/Vf8Ew7X8OThyAklhia
         edrg==
X-Forwarded-Encrypted: i=1; AJvYcCWVoK75x9saHcXh8bhja768915a1mAodFbCQyvTrhMeES9GfE91AIbhZ6+wwfDrWOOGbGKbm3jHP67zmqC1onwZFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNP1rU7TgPdcW2R3sSZcFY7kUoOtMkqkuu3VUkXrE3XI4pFOxw
	y1UmTOp3ySJOtCYZgOl00bpkrD+i4hsYIK/TDtsAj9T3PGxXlYMzjZc/2nrBz9k6MTOf8Bvsfdw
	DgDvOLiRzJIdKQ9uMvKG66WAXoBtA1fr7WcDA70nLWgobSy5MLtCCx0TyMTarruxT8+5uXbtgAg
	==
X-Gm-Gg: ASbGncsTmBYAtTaeu55e78mBWkrRsyto49ri1YKhsMozrVGRRDNb5LJS096ULe7uXtO
	obYMxOwI0RHw1lXfLM9npnqk5tV3pTtvwYY4cYPpEbQXEmd8w1fLVhTd8iNUrOAv0vrIr8dlL9c
	9IG7eVgsG2TbbyB1Rm+0JeeP3nIfwogIZ+TuGCtWUQUOGG6bKUBZjXlWfTBJ985JDjBrAo5WF+7
	aRFHoZS3kwLPEe5pYny18tCn1XmJYOKubhebnzwwr0Is6kQUjKqsRiTo5MIAidLj5XjfmAepEH7
	cDgOYOWELl07H6oA3NKWe1x9gljoPm+ZK/eUtOxuqR5R2YT3Ouo1g7YEtYB0l7nSr0kv0xj/BVR
	5
X-Received: by 2002:a17:903:2ec4:b0:290:b53b:7455 with SMTP id d9443c01a7336-29b6c3c2ac4mr143359885ad.10.1764049966261;
        Mon, 24 Nov 2025 21:52:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXMUITLBiR/ZLCoM1NGFajbfCNfqX0jMinzo5hzg/AXj8F8hDegLqk1If4egR7OthdW3Rb5Q==
X-Received: by 2002:a17:903:2ec4:b0:290:b53b:7455 with SMTP id d9443c01a7336-29b6c3c2ac4mr143359645ad.10.1764049965803;
        Mon, 24 Nov 2025 21:52:45 -0800 (PST)
Received: from work.. ([2401:4900:88e8:55c:808f:7bd5:9774:52e7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b25d787sm155753885ad.66.2025.11.24.21.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 21:52:45 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        geert+renesas@glider.be, magnus.damm@gmail.com, p.zabel@pengutronix.de,
        Claudiu <claudiu.beznea@tuxon.dev>
Cc: Manivannan Sadhasivam <mani@kernel.org>, linux-pci@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: (subset) [PATCH v8 0/6] PCI: rzg3s-host: Add PCIe driver for Renesas RZ/G3S SoC
Date: Tue, 25 Nov 2025 11:22:32 +0530
Message-ID: <176404979544.19308.1377321354838950467.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251119143523.977085-1-claudiu.beznea.uj@bp.renesas.com>
References: <20251119143523.977085-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: VDW0oRKpxsYqmPo3NpO9fB76R9SuKXeH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA0NiBTYWx0ZWRfXxBgGuHAKYFFw
 i/sNKQhAm2jRFENnXOiTj+sgzyMZAUzvZQtXOMHAsdAe0Yv/g2vPXeGJfBDtbn4FR7JyjY0fbMJ
 ekgTcFJ9L/fxnSkYWGngoM7vRte/54u0CtpUANT9R06ffoSfnesdmX9SDQcZ/HLi5ER8nbGc2JH
 zyy640UjOY4L7lxt5WHqY6zBndd0W1pkB91fisqYpvokrEUShdL7J8aWG8ebS17VbM6uqHk+VKa
 sMc6fOxv9lDueeqZFIkjPwKkSGDD0ostJ7NOhOZDH3I09vZC096dxfcb4ShGzhI4XTXCtqiJnTt
 RSKDP9epATBB7OdQWnwGRvg+w17qETFk8Gy5R8GhggwKykMZ/zWJrmn7BlZM1snJgFJmC3hckl2
 WbuZ3TXxn0x5r4mEvW2v9MaV9IxaOg==
X-Proofpoint-ORIG-GUID: VDW0oRKpxsYqmPo3NpO9fB76R9SuKXeH
X-Authority-Analysis: v=2.4 cv=d7f4CBjE c=1 sm=1 tr=0 ts=6925442e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yC-0_ovQAAAA:8 a=VwQbUJbxAAAA:8 a=L_-H442qEDLWYYIWuCAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1011 bulkscore=0 suspectscore=0
 adultscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250046


On Wed, 19 Nov 2025 16:35:17 +0200, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Hi,
> 
> Series adds a PCIe driver for the Renesas RZ/G3S SoC.
> It is split as follows:
> - patches 1-2/6:	add PCIe support for the RZ/G3S SoC
> - patches 3-6/6:	add device tree support and defconfig flag
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: PCI: renesas,r9a08g045s33-pcie: Add Renesas RZ/G3S
      commit: e7534e790557e9ee18a2c497dc89a6b31e435e48
[2/6] PCI: rzg3s-host: Add Renesas RZ/G3S SoC host driver
      commit: b4a5c0c9dd430be2c1b980c2b08078071f465ea8

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


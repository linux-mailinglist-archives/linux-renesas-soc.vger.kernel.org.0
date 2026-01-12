Return-Path: <linux-renesas-soc+bounces-26585-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E891D11CFC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jan 2026 11:21:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6721A3126FE8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jan 2026 10:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FD5E320A20;
	Mon, 12 Jan 2026 10:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N0007oBL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kUPawBjy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461822C21F7
	for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jan 2026 10:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768212997; cv=none; b=abURLyzSx2ELa3A1Oqipuexxg97uddWasKjw6Lp1W43fMIxbQjGM8saK4DA1F1lFDXtPDWtnzebr8LDueTPlwrtAGXFrvm9Y/eJZ5iSdi7rceb655tVBbrQdPFlO8BLinrdt/vMQc5LXNA27xR4fk+ihqASBXtRKnHQ82UE1n1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768212997; c=relaxed/simple;
	bh=jEgAybpVETf1wU8G3/LnbFjI9MGWJ7atKbSvXXLyX/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AQcvpghq8AU0FgE2X8jdaRAcL/NKXUq38SjB99efD3102GAGKbqUtCJIxzstqncoXGhx594JzVqjc9FMY6N0+8i5KBdkTfqUS6/hd13dWabVwGTnFD2aRJCBt75MESSHez0ETZvUFbcmIj1HAf2FgkjpvfrvuU2xFITIF7WS8+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N0007oBL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kUPawBjy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CAEdnk1315896
	for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jan 2026 10:16:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FopvU/uHrAiCRaPlRxkzQ4E02U64mEyQRO/C/UoGdLU=; b=N0007oBLwnURoYhN
	eSYRJ4CCvFTU2mFtVbWaO7sNK4NRCixAN8QoncTc4fLdXiLjZZ3LtLgTWnvWrKD8
	2hLiwLXnneWDrCtEL56DCJ1Tf2y0cQ2pDGVUANH0bOxBMOWZWsNeOr44MImXIAft
	qlw7O6MAu2yiklecld2wALs0aVsMod/IUS+xt48koG5fJ00i9Rf1nKk1E5VODoYj
	TWk/wMOFgViuKE5s7dXvMP2D9Zc1KwTPcV68eKK/vOxoIug+q0/qWhvQPT2vPfkG
	RL3+Ww9oIoGBslUC8XtEo6Goh+Y8QdhgSXb+VG8yKTFp9gVkZd2BNj7WpGicdwzh
	zzDOIQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmy1hg079-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jan 2026 10:16:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b51db8ebd9so2108840785a.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jan 2026 02:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768212992; x=1768817792; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FopvU/uHrAiCRaPlRxkzQ4E02U64mEyQRO/C/UoGdLU=;
        b=kUPawBjyg4JSvsgXtFAZJOr5dF+fa5DiP+lX29FJz9CfKgrBa+QLciwB7WQJ3Irk6C
         M1zeV2wVSEoGisUxj7q5Nd9ZOMzBMmuPBAsRx3taw/sjARKhB/YTSsUkb3lilSewPo2q
         xuBkdXTDeBNEbuO5QsMDCjg/tN7GonGEO7H6/b0qC+6oNh2wc2weJLPkNJ6KqrlatYVs
         ppVG5YThSOg2PetF1WbPxI6H91f5l3QXCYqqmxp++lRyqTWYWXIZedO8IIuPB5+T5AQC
         ozUeknly8/4C9WVmvVdTut6gnt7QozWg7KWCYL0VHZoFV6ElJrbu03OaVwo5QG4v/VYY
         Ting==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768212992; x=1768817792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FopvU/uHrAiCRaPlRxkzQ4E02U64mEyQRO/C/UoGdLU=;
        b=U3LXxDfTfn8CugYwFQSXM/oXcraCsPb8w2ZmCxQ4MW4K1+FmfrB6AgvCbdEwZKMbBj
         CgDOyTzOqPVY5jQM2VK6DIzZ/bJ39PiKCp87h/2Uag6sUw2toWLJc4EhpF46mNWT5ih/
         vU6SFrg3lzjvePi0CvLxNoEQJPo+OQ9v/GqfTmaLt4Lq7OSV0Q6E/09N/87vqVaTH2ux
         AIy5qDIKIRnwJPwiS/RxHMGWUMJDtS1SSbHr/uI2PO+feVz2Y6O3LwhIc4NxNrR7edX2
         BwlzHJmphR/sKoP07vyBbcC1QU+99cVfmvUt1IrRjDpFKvn1MZxBMuiv3XCxeRhOO8qP
         eEaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOKOS2jc1Iwb1Td0ySj6mMVU3r3dv3Vwb6xcz2eW4cyQbL+gFRE+EnB3alU9Lq2j8ncvtuj4wXdUvU0ADKgur0aw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzE5Q1XBFQoQtpTK+sggfTPu1qHPmCGO8cGB0plBa9zzhkOmLeH
	s2uwnhs8un2ICiqEXpi3QpwM359rA1W46Nq3gEDatzqJeptDg80R6//Yr33mwv+tC0tfolOEuuQ
	aHylVvOMWVFk7d1OCLkMrPTHV7Jf3TtB229l9NrTvAC2AJaDntDxMXz+Wj/Bod7duPLJEefb+Dg
	==
X-Gm-Gg: AY/fxX4lPXsmKqD0iUCVEHAsCNp5UnmFAZaG3QqfzZ946pghPdUPMztGATgLSySoI3x
	hRQECYCqDKQ8dx7TmiMLzPDBJ1Rz3tq67ivL9O15kdypztfApeU3tm01I2QekTxxxGKXuaEPWen
	JUWXy11Q0dpEkpRl6lHfHGPS4lsur/lUbyKW/JuUJJpDTe0Eup3TcKO0brmL/JpLlvcyMD02XO2
	CDUQZb6mroVWqtxFRDC4fMBdA4VbIZh/PwuurnImYcXPLzE7YRbatHwIecSruPtPfeTUJOayOrb
	qfMUT+5z3wZ8OCVz8J4LV3fw5U7w6R9xP2H+IFgyTHGEsFMnSHBYCr0sPhGoPovWLbf5zWRBRjD
	GvBidhMyzdsWye7CThoSBGP+SK/S9yeVR5YJpk5Mw
X-Received: by 2002:a05:620a:44ca:b0:8b2:6251:64f9 with SMTP id af79cd13be357-8c3893f51a8mr2447162885a.58.1768212991761;
        Mon, 12 Jan 2026 02:16:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH2C3RkdMQFFZ2lWORPuAazNVGVOCtBnDoC9lVD9dpEON9f/Z0WBVt2UJ654FrVQqL6BPNyrw==
X-Received: by 2002:a05:620a:44ca:b0:8b2:6251:64f9 with SMTP id af79cd13be357-8c3893f51a8mr2447160985a.58.1768212991276;
        Mon, 12 Jan 2026 02:16:31 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:eb74:bf66:83a8:4e98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d865f0cf2sm126530355e9.3.2026.01.12.02.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:16:30 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 11:15:43 +0100
Subject: [PATCH RESEND net-next v6 4/7] net: stmmac: qcom-ethqos: split
 power management fields into a separate structure
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-qcom-sa8255p-emac-v6-4-86a3d4b2ad83@oss.qualcomm.com>
References: <20260112-qcom-sa8255p-emac-v6-0-86a3d4b2ad83@oss.qualcomm.com>
In-Reply-To: <20260112-qcom-sa8255p-emac-v6-0-86a3d4b2ad83@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Matthew Gerlach <matthew.gerlach@altera.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Romain Gantois <romain.gantois@bootlin.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Heiko Stuebner <heiko@sntech.de>, Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Minda Chen <minda.chen@starfivetech.com>,
        Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
        Fu Wei <wefu@redhat.com>,
        Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Shuang Liang <liangshuang@eswincomputing.com>,
        Zhi Li <lizhi2@eswincomputing.com>,
        Shangjuan Wei <weishangjuan@eswincomputing.com>,
        "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
        Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>,
        Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>,
        Samin Guo <samin.guo@starfivetech.com>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Swathi K S <swathi.ks@samsung.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3515;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=SvgO86hvregXRCCIKpnZ8DXQ/gsX+xRnz4fK2MFB8zw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpZMnpS68E6MPAKTYOCCDfAdG6YpdqTFBzJlHYT
 m1XfvKT9n2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaWTJ6QAKCRAFnS7L/zaE
 wxcPD/9Jdw6lE3yxZNe/WKwcXn7j9F43Ct75jwfkHmaXABy+zG9+bJzVfvPYMURVPg+Xt06I12Z
 3ru0MCKYVex90w9rmlDU6EwpPjbjV0KUKl70wPpkXb4yEbeULkgr9QhJKA5fT2ev/bHe2CeqVUU
 U0m+626PDZEKBjBGurJ9c4ykqpLzgywBNeqdXThfbVmR/UWy5bX2Tf4szDreYhsevntHLQFIB7f
 w/EM68rQlxr++CEPaXzTW9MBGdrPtMt7YNadWPmSExAl7ZIZIAg+WmVl/R4zy8CcRP/wyGyytKh
 xyKinAXyw5PpALc80Vb3/h6fn5GY16S2DN2gwMQoeg5SOGTm1BnLjLSBeyEc4cZbm6gTNyrLHO8
 MBYXFAe5icfHNnlYNFCrHs5vnxuliTVTviavacY4xlDxWaaAg1gJcD/jPrgn8FqSpwDkaastAf0
 cQEwBoyqdkTN4gJRvhH6H+thiZWhicampXmqGtQCbv+Pb/V32siDJmNpulXNdnzuDS48k9/CA3t
 zlkmsgaGkezlzg6RtOK1e7JbxarQq955bGhZtcBubwa5w46j3M8pR7OH6w9YINHvqI1bvv/OkDQ
 XS9gbNRTdOJBCAVwmjKS3hzcv6uv3zZFRDc5pLE/CCIgb8LHOhNGNVnpgF1M9jzQETcqf8NAE95
 283LuhKXD0RE/tw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: CtEZT4BiJZkM4f7zOjOLh9q7otybyMSj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4MCBTYWx0ZWRfX1S9KZdtrSxKe
 IpLpRCovoZz6oEUK4+8UZUgtVZrpPeDbR3PJFXgyLoElO6q/KbNzutHO/s50mn9L1VCf+weK5aI
 EtAwquoLVqYFnwnhAQOiMPSSMUNdEcYnEopAkqw5jRb24/DG9DTk+baCEYT6Ot0M0qZQ6hRLKjm
 8/AqeDTDi7p3yIyCAtkgsfJl11s77Y8Hxa+rI1d08C/ZLd/T2DUJB1tHvoFSb8EhQzQZ2j+oWB0
 AbY9O8rY0BETm4JEmCn3Y4DPlO/y/tGC1gcGfh4XBQ2dh2amQUeO57llGW3TYVQdynHaiK9qR+2
 JPR2UDUmKb7j0mgnDP1Y1yhLhurUaWFpcCl96JwY1qIXBnZb9gImTGmmmU8Fabgt8ommodKZqO0
 Di3+dIPTL2fre/X+8+OVgdBE5MyKnQnqamcIWq1gW+uVoTBcVfPSHdh7la9Juzx+rWbzInF75PU
 LFJzh8pkomm2ezCR5aA==
X-Proofpoint-ORIG-GUID: CtEZT4BiJZkM4f7zOjOLh9q7otybyMSj
X-Authority-Analysis: v=2.4 cv=EovfbCcA c=1 sm=1 tr=0 ts=6964ca00 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=91Jjr3N24NtUYBPB5vwA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120080

From: Bartosz Golaszewski <brgl@kernel.org>

Now that we have a separate wrapper for device match data, let's extend
this structure with a pointer to the structure containing fields related
to power-management only. This is done because a device may have the
same device settings but different power management mode (e.g.: firmware
vs manual).

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c   | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index e0f0eca943420e24dad4e506e12bbb1eb731b8f5..54458ff5c9108a6255b38677f4de973511b5176d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -91,14 +91,18 @@ struct ethqos_emac_driver_data {
 	unsigned int num_por;
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
-	const char *link_clk_name;
 	u32 dma_addr_width;
 	struct dwmac4_addrs dwmac4_addrs;
 	bool needs_sgmii_loopback;
 };
 
+struct ethqos_emac_pm_data {
+	const char *link_clk_name;
+};
+
 struct ethqos_emac_match_data {
 	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_pm_data *pm_data;
 };
 
 struct qcom_ethqos {
@@ -303,7 +307,6 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.num_por = ARRAY_SIZE(emac_v4_0_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = true,
-	.link_clk_name = "phyaux",
 	.needs_sgmii_loopback = true,
 	.dma_addr_width = 36,
 	.dwmac4_addrs = {
@@ -324,8 +327,13 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_pm_data emac_sa8775p_pm_data = {
+	.link_clk_name = "phyaux",
+};
+
 static const struct ethqos_emac_match_data emac_sa8775p_data = {
 	.drv_data = &emac_v4_0_0_data,
+	.pm_data = &emac_sa8775p_pm_data,
 };
 
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
@@ -744,11 +752,13 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_pm_data *pm_data;
 	const struct ethqos_emac_match_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
 	struct qcom_ethqos *ethqos;
+	const char *clk_name;
 	int ret, i;
 
 	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
@@ -796,6 +806,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	data = device_get_match_data(dev);
 	drv_data = data->drv_data;
+	pm_data = data->pm_data;
+	clk_name = pm_data && pm_data->link_clk_name ?
+				pm_data->link_clk_name : "rgmii";
 
 	ethqos->por = drv_data->por;
 	ethqos->num_por = drv_data->num_por;
@@ -803,7 +816,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
 
-	ethqos->link_clk = devm_clk_get(dev, drv_data->link_clk_name ?: "rgmii");
+	ethqos->link_clk = devm_clk_get(dev, clk_name);
 	if (IS_ERR(ethqos->link_clk))
 		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
 				     "Failed to get link_clk\n");

-- 
2.47.3



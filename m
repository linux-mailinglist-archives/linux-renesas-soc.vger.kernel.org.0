Return-Path: <linux-renesas-soc+bounces-25881-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5910FCCA4F8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Dec 2025 06:23:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E42783025A76
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Dec 2025 05:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1564E306D36;
	Thu, 18 Dec 2025 05:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B+yJczoV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YwJNrxDa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F80308F03
	for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Dec 2025 05:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766035390; cv=none; b=fYYWiwpMKxpmL3y/TKhYLJCjn4Ai4tYTjoHoilGUzdpHQB/Qoo+YNPVjbkoHmO1KPQP+m9EmrITZkTyUO0mHYiBlAd99ChOKVl3onS4JV98JQVZ/ACP/hCqZUobG+AQbhVyi61KgGaEnDrjdJg0iduWvoiATitdv84LdORhJVrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766035390; c=relaxed/simple;
	bh=RQx9EjbZzA4ei3NX9t2BJHxX/pI0/xNzFou4zzkIS7c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=p7MPzMYq7qKCMmSLroA5JDgp3+B4SMm4wvmq27xn4uftPRc7iF940wq/PvNfEt6GDD8UzOk3x8it3JmEfiIJEXesgqmaDeUCidaQYnOQIxT5fMxK2Dgbe/1ZEMAAcNPG6ZAD+NYx7iB+gYZbEGqHeWFPKeyzbLvInGB1pJhHLRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B+yJczoV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YwJNrxDa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1Yp2S4148410
	for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Dec 2025 05:23:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	enmCRQ5x3mh4iFRLG50m7N49AT+rZ2yyvL504EZOAY0=; b=B+yJczoVTa48n6Dq
	aTtBhDqYq+jTEvR1g0nAO5TlwI9mnxMUXbfOc2pgM2pZ0ox8qH77D4Ny/hL9jLHA
	bcxreMjfM65879tY334/iUfZFalhUbegZp0KFDqHktADR3wU3B+q0dS4fRZWPBXl
	Y1iy6xfGm450ZSWNeylJZp1anHSxrYsb6HmB8pE7BQrLIpncDG9JFv8/LjIvN5Zw
	nVB93d5+3XosyN3bW7PMN93pHx0hD1OPKkodecbCxw5W+e4E5Fkn9Fc6jLLCOkDj
	tJT00dKdpDludDHuXyyg1jPMUVRgNVIugCgzy0xPEvPpmSC+/FLAVMGIePYXTnjk
	9iWoYQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b40u79rv1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Dec 2025 05:23:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34ab8aafd24so965650a91.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Dec 2025 21:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766035386; x=1766640186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=enmCRQ5x3mh4iFRLG50m7N49AT+rZ2yyvL504EZOAY0=;
        b=YwJNrxDah5tmAXi1xA1H+8WDV+tjoqvOAMrzwEchYVSwelGvDNRND40NTdE7smtwT5
         xO+ixCMyqRCxuMLhOrtNvrIvFIRDJf5MyoiwJKnOA7d55bzjffFqZ/xbHICKKGT1PyX9
         zwgP4pKI+1s0yHd94TWlKO9587RL5ZyY9MXxH9I1hOKRTzPc05XCj6ulyUuONavSiZjl
         P9AMvuR9YfXX0sZQoKq0MQbAxgbffrGIgbk/+aXU/hUqZqG0BO2oUjtotKCT/UVrjQ+d
         L16VIEpYbo/InYb8hYIFbhyAUW2H0dsufO1s+ji+K2RHV7nRMXmt27grDOOVPfI49a7y
         O1Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766035386; x=1766640186;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=enmCRQ5x3mh4iFRLG50m7N49AT+rZ2yyvL504EZOAY0=;
        b=Uy+mozNvhK0ZsiVMyYs0GgdLwTD38wOhu5waIZ5Vw0rf4vRU2CHCg/tQyOLz6dtS2n
         POTyTG0kGXI4IS+CZPsul3JyHrgiCf4JG0N2VPT6ho1Mo12j43d+p5ZhKL+vIRqMexJk
         8RdpNIScMF0XSRr2gFIlKYTe372aVcBMdXhzCkXoOmrt9VQ9HLtxlIvd4agEaFAH/+dL
         O1zdbrSUnJtZk50YsBSX6iho0SpSl3AkaxMshRseQ8FhF00HKY7U3yOl+hAkHHxcE6lZ
         qLCVIazHD0OGeCPu3oIPpsCgZ2LNy1GX4KyepgCCRZ0to0Mb8SD6gMnhRHjyyhr7Rxig
         GWPA==
X-Forwarded-Encrypted: i=1; AJvYcCWOIhnSJpJ/DfRmjEiWm9RYv2aWELg9kgdSxZSMl3Vh4nmKEjgDQZOYeQ4ZOZJXpFWcqvglwpPnaAXvQak5dX2PIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlpcW7c3O+N+IRhoQwgwP34fDMHSqRyYiMz30q2A2hDVeMn9gU
	vid7GNW9D6qObh39QpPvLSegMQz6Ttj6WT90SR9j4Vd7YhrtrW8xEd/ni4jtXBQM2HpFtzd1VG3
	nhW9OT7pA94k4w10K0c80fG8ybpvP1OFht360zAbER/almjn6kOlR1zD49KGwEt1xBH5Y2RziFQ
	==
X-Gm-Gg: AY/fxX5b52Z5zP5Zp0iI5vlwHd29WidK0H/SPYjqTFlzo/zhBA4R/I7VeC3rCz+MwJ8
	0YbT3BZ0F3wfbjrCVO+qIIjjv2DfumNxRL0yNCWHvd/mD8AdD4KAMC/o/C6XJeA+t7AZREG9mV7
	NPVzq7OGWv/xKtjMsn2RDPvGe+bcrnytgRvm+WNI3tNDHj7HTaPbjdIPpsywy1n7rBQ/CJYosch
	W6wn7lsaCGrMDSx+ePGdsJAOUJHzHLgkjX5RQkkh/E6ODfe7xwuWzIOGh6HfeRSmwqSv1l6mHwj
	j7c8umfVGFxg99ab44m54FLCj3BLv3H9enqfnEvkFTRmuAZN12zstVDswlyWwcSo5ZxSA/L5/J8
	6roE52UWbtQY=
X-Received: by 2002:a17:90b:5188:b0:34c:2e8a:ea42 with SMTP id 98e67ed59e1d1-34e71dbcfc4mr1900807a91.7.1766035386076;
        Wed, 17 Dec 2025 21:23:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1uif5/k+kGaUzokc/1cPGTxk/yEbsq8GumAvceKN56qoZljhicE+tTvI4yGX72oVtqPiFZA==
X-Received: by 2002:a17:90b:5188:b0:34c:2e8a:ea42 with SMTP id 98e67ed59e1d1-34e71dbcfc4mr1900791a91.7.1766035385621;
        Wed, 17 Dec 2025 21:23:05 -0800 (PST)
Received: from [192.168.1.102] ([117.193.213.102])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70dccd14sm1175108a91.16.2025.12.17.21.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 21:23:04 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Marek Vasut <marek.vasut+renesas@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Nathan Chancellor <nathan@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Kees Cook <kees@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, linux-pci@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, kernel test robot <lkp@intel.com>
In-Reply-To: <20251014-rcar_pcie_probe-avoid-nocfi-objtool-warning-v2-1-6e0204b002c6@kernel.org>
References: <20251014-rcar_pcie_probe-avoid-nocfi-objtool-warning-v2-1-6e0204b002c6@kernel.org>
Subject: Re: [PATCH v2] PCI: rcar-host: Add OF Kconfig dependency to avoid
 objtool no-cfi warning
Message-Id: <176603538085.6580.3625113457403612097.b4-ty@kernel.org>
Date: Thu, 18 Dec 2025 10:53:00 +0530
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: hGd-6KwYXd50qxzGXWodGRsuF5pFWt20
X-Authority-Analysis: v=2.4 cv=Z8Th3XRA c=1 sm=1 tr=0 ts=69438fba cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=PLOdWElDzbaVVj/XHNhp9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=ehsjDiE4JrN5eREjfRcA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: hGd-6KwYXd50qxzGXWodGRsuF5pFWt20
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA0MSBTYWx0ZWRfX17y3pB1q7RZH
 2nxxeg72nVYQ1/kq/4zJCuZAnBlVFmkhN8MJ3Mk7IZPRItehQDjpoyyxniXeKEX+kMVvXj41rxF
 cQfxH0WUXqzlxp4V1Y+8Ot16mDQr3pP8i+o+7KYtnMob8Fxbb4RohichEeHxJHdAZMcxcV2scVw
 aUKdRDJy16X7ik3RzOdLW7QyIBl3nHUR3ZtqD68Mev1ezr9D3d2Kl8RMqmSTzQAl54szai6QrC5
 BjPWZevz7blkpGH+LX8oUdZwA5mpUH2sNZJQiYV8S1fSx8VWxB7TClA5swmBMu86ZlX6cyprTYm
 cNA+fT/Al6B+t0ThpUJubycEpW636j+WZj2+3tH3C0W58F5//+CF/pl0xhgdmPvVWXqdSgv0gh9
 Enjd2yxczTpigrTqpH/1xdsyHnAlhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180041


On Tue, 14 Oct 2025 11:20:27 -0700, Nathan Chancellor wrote:
> After commit 894af4a1cde6 ("objtool: Validate kCFI calls"), compile
> testing pcie-rcar-host.c with CONFIG_FINEIBT=y and CONFIG_OF=n results
> in a no-cfi objtool warning in rcar_pcie_probe():
> 
>   $ cat allno.config
>   CONFIG_CFI=y
>   CONFIG_COMPILE_TEST=y
>   CONFIG_CPU_MITIGATIONS=y
>   CONFIG_GENERIC_PHY=y
>   CONFIG_MITIGATION_RETPOLINE=y
>   CONFIG_MODULES=y
>   CONFIG_PCI=y
>   CONFIG_PCI_MSI=y
>   CONFIG_PCIE_RCAR_HOST=y
>   CONFIG_X86_KERNEL_IBT=y
> 
> [...]

Applied, thanks!

[1/1] PCI: rcar-host: Add OF Kconfig dependency to avoid objtool no-cfi warning
      commit: 57833f84f6f5967134c9c1119289f7acdd1c93e9

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>



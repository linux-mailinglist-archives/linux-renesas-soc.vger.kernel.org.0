Return-Path: <linux-renesas-soc+bounces-26213-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 150C4CEA46C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 18:13:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0D4E230078BE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 17:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11F45221542;
	Tue, 30 Dec 2025 17:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LmPOQtwD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HX9phoCs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F4E7081E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Dec 2025 17:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767114820; cv=none; b=WnEvvMyDz/xkk8WNFyvsAmALuf9ndyHOO7QHoOZ7KxYns+v4FwxAPuQvtlAaBl0Vfib6JRFgsh4J7l//fJM0brmve1L3+IunaFsuCjmD3BRiZmD5pFCXfw7vbR0w+p3uKSLmNK/GTgahFihMqFTlZXdmleVUgV2AlLCzoqN8yIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767114820; c=relaxed/simple;
	bh=VXCiGMnnNa/afDS9FEx92+VeePXPynTiGO+i3tGbTbk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=syBE29irVwY7JuY0jTpkfPvIDpP6u+mG8nE8egfOJ0TAxQaGuvDLQ3ikRAKHAMXKDAARLRbtBzALlHzYNZAr4sPNubHkoP3iXvnTpTe8zRfgj0oGjovZMd+jkH5g97p7u65Ch22OZct5w6PCwnIIVJceofZ4HFS8pMugx9Ypyqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LmPOQtwD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HX9phoCs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU96Fx72723370
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Dec 2025 17:13:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O2ELm1lluLn3D3dd27glXZ0eYBKJS1nER7eS6v4eehQ=; b=LmPOQtwDvtkgiDIk
	/um4xqPfNWbAB9U6iPRFBO06N3pFumd5Kn9bZCjfz7ZsxfCYlGqZd3zv0kzm5MPI
	Gqj5m8zL3orNCYIrkwXBW0mQqdtUMz0eKeGxlYaacQmyqoD3GD1ldCMRl7iXHrxA
	5MIWQ42RDnAHULQLODl1s4rRowYeG7HLo5MAxHBtFxCuNTMtZqK1UOJDDrTQFPGB
	+MtKT5xqNEZFtB2TU1iGuEUJgEfPHGE7yS4rdJn5IoN4dZ7H9ym98e2r3Z5psTmU
	+53OSkEB4v2y/eFMrUD9eh4zFB9P1n0/mfpwQ/HTkymqAn2aYPYljAb1VxxYESJL
	+ZycgQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc0vdjg3e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Dec 2025 17:13:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29f1f69eec6so127841685ad.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Dec 2025 09:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767114816; x=1767719616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O2ELm1lluLn3D3dd27glXZ0eYBKJS1nER7eS6v4eehQ=;
        b=HX9phoCsmyYypbhdKjArwjfGvJwpdzKqLtlXbFVtz4H1N2zCV96sVocWT4xySH7F4V
         is5vHxQwxUxWNDY0WC8DE5tUvrncVghv9Eaoc2GpjZjl/fA0y1FaeXVhiiK394O2p94J
         kBQ1N4CWgluDJPtd+0UsJ9Wv5qlIg2vnRmnK2a69QV2819gAET65Ms7lFBLAHaKDFtwy
         7DSBRzgP6w9S5Ch2Vzs7v3mLHG1NoQgc5/MhWg6y9/OVk8VTjVS9GpzbdWgHeuJQQoAD
         IjzOdzqqXvIV8KkZs5FZ+f+VC2CmXlf5wWVyZiUkdekgC45HFJcL4CJ75JJ6kGF52tnY
         iqiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767114816; x=1767719616;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O2ELm1lluLn3D3dd27glXZ0eYBKJS1nER7eS6v4eehQ=;
        b=C+xt8t5YMcVqlzTD3f9jBbUncCY9wdGPWWCluirXaLTjdA/PcMb0fWvcyw12UzW8JK
         EibzNHXd2JYt4kSvDsyLnX+l885O5f+Y+5UvBycjgjP5aCC8gcA5TuJJ0aMJ0IxAX3Fm
         H/k7lEzlxfgmZS1mV1kKit8ZKvgIEX014V8h/7bijra62+5t5bGd6gliH1bvSZ8hktgm
         cOngjUeFf62XKl40QsLk0bmj94X2O4fBlfQWSUFJ3Mn/iubCFWoToeOGccfvYNehCtC6
         DDTXNKg/i6ixJTNF95QHpzs5jaXuo+mm9fKoADeReGQBZdTq7PDVSeiEJ/7R1BlwpYYp
         TIJg==
X-Forwarded-Encrypted: i=1; AJvYcCWmdUwibQIwpstpqb7YkVuH5YgtoWZercg2Dgoijb7fBPeHylb3JIvDcRiRk4vZkt/ldMUIriJRRtMOGjSyth2Wdg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdo8bj3slST4Ps4mx6aRI4UUFqX/17D+A5n23ExdQXRNkNeo4l
	heqxvWEMMVpjPsSZGQ4pd0efYkdp3ZlraaLrrp+1718OCenaV0oKTjoDisWJRtqeVT7NEI9ykhM
	VrOpyqbw2LABKh9HUuvfhwJoW+jtwpg3kUbDbiMG5GsAwWfFfL2BQjCrm7EIlvxPcyjaCbQGJOJ
	iQn65XhA==
X-Gm-Gg: AY/fxX4xdypU5J6Wk1AURB7RlCj6eV4pfptxflwot+0z9AA+EEuMEd9GJm7+QqDRE7k
	2oTTRAdTYPYiwMIz01T0PK3nmQdF2NCM/9fbMzxnlfCDwZO7La3GowATZ3Ls9It2nIcsNKaGvX/
	2gjvdk4zvAsY8xxU0ZWlYeo7hLsdu8i/7QL+IlNeqiwgZmDAa7WEAtW0BsNYL0xXYrohpIXk5jr
	bLCWRRZAp+HUpZXSmXWQllxsulfMC3UVnCCaz1CukWOmbsi/6Vd6leRO3kevuhyE2LZxrkQJFn1
	rWUGPI8Y3IAbiRl2QzT13mE0yBCUg3VVQJaqkwatnnmmV91XPLz4l0jiewBXFNtRsf6JNNm8JJ6
	rBMq8vaM=
X-Received: by 2002:a17:903:240f:b0:298:4ee3:c21a with SMTP id d9443c01a7336-2a2f220d4ebmr373188905ad.2.1767114815526;
        Tue, 30 Dec 2025 09:13:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVt1C0/8+CYVMPpEK1t2gAyMpRP82PQkqWeY8laBzPkqHbdx8fdFoEUUer001YqHdQYYD/zA==
X-Received: by 2002:a17:903:240f:b0:298:4ee3:c21a with SMTP id d9443c01a7336-2a2f220d4ebmr373188295ad.2.1767114813886;
        Tue, 30 Dec 2025 09:13:33 -0800 (PST)
Received: from [192.168.1.102] ([120.60.65.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c6b7b0sm307540245ad.16.2025.12.30.09.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 09:13:33 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
        robh@kernel.org, Claudiu <claudiu.beznea@tuxon.dev>
Cc: linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20251217111510.138848-1-claudiu.beznea.uj@bp.renesas.com>
References: <20251217111510.138848-1-claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v2 0/2] PCI: rzg3s-host: Cleanups
Message-Id: <176711481112.2043082.9998692929898772326.b4-ty@kernel.org>
Date: Tue, 30 Dec 2025 22:43:31 +0530
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=dfONHHXe c=1 sm=1 tr=0 ts=69540841 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=+SK5D59PVgoENw9OlSzWFQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=yC-0_ovQAAAA:8 a=VwQbUJbxAAAA:8
 a=crh6BrjQ4IWGsnHI0oEA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDE1NSBTYWx0ZWRfXzD0kzGkKKIFb
 gGzO5L+IdSk1yHqstH1XSb8PobI/8cdm1rYgxJw/Z19Nn7vlkv5XkwzrGb4X35H18+AiUCWE1tM
 UY+oOij+r5Ny1gSZGDCTMlnZHrmT7lIHYrL8h1vziK38frCmFeAP9ob2R13r3E2JyrvE8hlLxop
 RbBQht2Dr+G1nqBVXBxnxAAeIRJli8onvk80u2zj67apyACCVCcWd5SOwpt7eEpwL9NYwfwwbqk
 t/Kf3fnm2x15MIgXPqngHEpbmPNOMtbf65g7U4eVC9iYeLYGJzwJNXhm6eCL8T3N9quwrdOFwrb
 fcGTl39lVVfGnFjTjaoD9yqjF00oPtKKml+PDDJazZ1tFZ2H2I4nzbJ2xXN1ZmxfudfvNdSvuvI
 LluDEX58dJgavna6wA0T0jBytuVUsKvd/BXWgB2bSyiux3q+DqpVto5uiztqRKWKk6UOu155jXC
 0msB4L7gUqojYW8+AUA==
X-Proofpoint-GUID: S3C5EB4PBBbEDIo20ZJ95umnFbum5R3t
X-Proofpoint-ORIG-GUID: S3C5EB4PBBbEDIo20ZJ95umnFbum5R3t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_02,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300155


On Wed, 17 Dec 2025 13:15:08 +0200, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Hi,
> 
> Series adds cleanups for the Renesas RZ/G3S host controller driver
> as discussed in [1].
> 
> [...]

Applied, thanks!

[1/2] PCI: rzg3s-host: Use pci_generic_config_write() for the root bus
      commit: 4b86eff47e205819eb862097493ec20e25ac8f56
[2/2] PCI: rzg3s-host: Drop the lock on RZG3S_PCI_MSIRS and RZG3S_PCI_PINTRCVIS
      commit: 62d4911290f9cbb16f5b6ba6782660148a656fc7

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>



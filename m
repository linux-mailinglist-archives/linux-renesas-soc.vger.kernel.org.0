Return-Path: <linux-renesas-soc+bounces-30053-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JUsHM6tvmmEWgMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30053-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Mar 2026 15:40:14 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E322E5D90
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Mar 2026 15:40:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 949873008457
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Mar 2026 14:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48A112E88BB;
	Sat, 21 Mar 2026 14:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dvgK1IUO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EhhvkVpb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E800351C2B
	for <linux-renesas-soc@vger.kernel.org>; Sat, 21 Mar 2026 14:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774104009; cv=none; b=q1DQiOEcQQzhEy8Ojze/jtnZ5WFchkP+5xEhuJkFSixZbn+ojV6C4CMkDE8VHbQF1PDRBCv9ZpY8T6VBiW9yMsmBQBSdfKtDf7am1NqKj+/KmhRGxxNdZ5wDz99obsDTegP4j9pN3oPrVqqOCb5IMgrLkeCk91xbuRc+9jeJJVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774104009; c=relaxed/simple;
	bh=16Q85NJkL80Z81gFXtlKfNUW7k8w6fob7p4bVRzqHIw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=F69yz3nA+N1keu1k9D26Dhf01FUSpbB9SgDWc674EvPdVFxUCm6TXyJlN6W78L20ZZlM+TL8pPcivcFBSFkInREuIJV7LkXdxwOf1yN3Lk+/CCoOwbuiLxlZXurQUf9y9Tm39XjS2bOTNawcXnmyE1I2Jp2tUx5+9uIy1nIpcgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dvgK1IUO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EhhvkVpb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62L5S83f360207
	for <linux-renesas-soc@vger.kernel.org>; Sat, 21 Mar 2026 14:40:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	088YGn3nYbjUKQ2G5hkNpceivsXtytVja5O0dDOJnBQ=; b=dvgK1IUONy0gKCLQ
	YjXS/iT/vdxUyUO6/yLjvCvDP5TKX11PQvCOvMKSjev8wDsiGSILfWguMjFJBHl1
	rDVXbkdN2ttlqfmKoxm1qzs6DViQ8c4FHcOXSln2CKO845mXz/pAPIMOjnyMb6D8
	XgKnGyDheGO8lyhcUHQOcsrg2OqYwRX+wzjv44hSBl6ZXYfoLyH8zUbQ6+k8jkxM
	AwadmXK6HC7Tos6GEmBkB6FXMH0b6r+vRy92oM7/9T8FFvZ6dquF0qhAviu56oEx
	NaqlF1MFO/9EnbvaXiCkp9GUIjh0Z1A6vyVdPC60PszXUCcDb3DVFJYBNrexcAZJ
	iTbOPA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1j9r8x4b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Sat, 21 Mar 2026 14:40:07 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b06b68783dso18485325ad.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 21 Mar 2026 07:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774104007; x=1774708807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=088YGn3nYbjUKQ2G5hkNpceivsXtytVja5O0dDOJnBQ=;
        b=EhhvkVpbOa7gBH+n/CVmvmoUr9pr+Q1BtUDK5J8L9PW2fZag+NsZwud5dCQP3XEDed
         xdxDDtdDZjJo6cHzubz0uSjGeF0Tn2JlFwFnlnZhYvSuetyN7oYEezTlsWX+SNYPAo04
         l9ouYANi9jmDP2pdkbU+G/mkEEwtZ4glQcgD3Hgn9qVhCycmNeQHWqRWXjJwtlfNiygK
         /eXG8/Rs9OR2+C2nDJ482E/s23/nD3tTNDa5HDwOZPkPzF99ZLpY/gFMdrg1uUbYxHfK
         PrmIzVM+lDAligJru+bWgYENPDPksGf6lcoePlsZ6HI2ED5kQ5RGp9ip8G1e3w9BjTkl
         DqNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774104007; x=1774708807;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=088YGn3nYbjUKQ2G5hkNpceivsXtytVja5O0dDOJnBQ=;
        b=HkHBcoP+HGL3mLtQU+SLXxXRdUOOLe2dd/MyaG97/gwWa8RfiVlV1jsJCRWF2PhdSI
         IRM+Ja6NuFhEYlG5OnEn3vu/Vajd1GAvTT7OEDYQ5IO/lhOFgPq420xqjEWGyja1OxxE
         7JhOCaTQtEVvnQuuvXVBo4pGpdldaR/bXpYX/sEv9GsatlkgQuPRCqX7pzM4OnB+h9eh
         CcMqLWCjvl1eCtIRbv4KPMKOQP/GUuBXKzGghdSXE7bdc4rcqOzNl1TNpkQYlxFdL2Vu
         YMWvU9/0Up7Y2rYN7HclNHlWf487Nr2ZcoMA6v43392fe72mRR9fs4XeoW8U7VBnbsV/
         ksLg==
X-Forwarded-Encrypted: i=1; AJvYcCWPyJKAQMvQs6bFz3rxD+HiRGsUOeluJF5yhoiAI7yWbOxulvdsYF+O7diwdpqXz+DYWgHZ/i9W620bFRGZuYpm9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzL6g/LdKGV2wMYI8Vpde6y+jO41PKOl1QHP8S23vDDs/tn3mZy
	XRlMf5ZJZGwENrPyYiqhd2LIt7y5wugUmYfjCfHwYHY6fIc3GaygfDnYRAuv9480c7NgiSwMIP+
	biukiiQhy01I4oNBoB4fpguBXQf7weHAIz1GrIdO1NsOVT1ldekWQQzNr57t+FWr2fDqcjIQNgw
	==
X-Gm-Gg: ATEYQzyk0YML+xgWkXQ8f6mamb5BNZV4FHEB3ed7l+P7bwDjPuwFRp2YS31kH3DegVz
	AG2dDy/k/3bRtbiVEatAogmkWHYBoZmqd3VlmoNIabiFx+boauNNsxGS9FaGK7CqelsaTimE3hm
	IhhwOl4jWjYVf2zfLXPZmu9yxcFPIBCL4KVHi0NARveHbVpynZ69r1z2E9QWT40Gm5RV0eWb8fG
	5EUwlqMLQJxw1pfnSZ4r8xiDM8PUXRo6qCGnwanGcQu4q/CMLM/1ZrQK6Ivuw9gNruiDSUxbr8K
	+8Y5Cfd4B95+V1cFHibBMqChkF+SmVBLsqqK8OjjqizSHuk3V5hQrOZ2TG/ReG32rf2F8DFGU3D
	LFUiynuDbbhQmtwET
X-Received: by 2002:a05:6a20:7d8a:b0:398:b95c:51ed with SMTP id adf61e73a8af0-39bceb482ffmr6054079637.35.1774104006598;
        Sat, 21 Mar 2026 07:40:06 -0700 (PDT)
X-Received: by 2002:a05:6a20:7d8a:b0:398:b95c:51ed with SMTP id adf61e73a8af0-39bceb482ffmr6054060637.35.1774104006085;
        Sat, 21 Mar 2026 07:40:06 -0700 (PDT)
Received: from work.lan ([2409:4091:a0f4:6806:94da:c4b9:51d5:d888])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c74443cc2a8sm3941657a12.27.2026.03.21.07.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 07:40:05 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Marek Vasut <marek.vasut+renesas@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Niklas Cassel <cassel@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Koichiro Den <den@valinux.co.jp>
Cc: linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260305151050.1834007-1-den@valinux.co.jp>
References: <20260305151050.1834007-1-den@valinux.co.jp>
Subject: Re: [PATCH v2] PCI: dwc: rcar-gen4: Use 4K EPC BAR alignment
Message-Id: <177410400094.17067.12979287248097257456.b4-ty@kernel.org>
Date: Sat, 21 Mar 2026 20:10:00 +0530
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: 4jB9Vn3H54TlSlOHpAILHitgK194UZfs
X-Authority-Analysis: v=2.4 cv=ZPDaWH7b c=1 sm=1 tr=0 ts=69beadc7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=YQ2wzFUj4MmMy6G3m4IA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIxMDEyMiBTYWx0ZWRfXxFY8L2RUEOgI
 C4VIzc4MqPTzHtYUok3ZEBN5dPwEu7qR8AbULsjP+cf//vhg1sY3uwjh4kROb+0J5N9Nl7RtrUh
 w+Aq0Pe/Uw9/HorCddHzXSLQDfb2sMe2IGh0OfBYTGwCAPhDlHH+PqTMR+LmzSCP1IuD4QD6xLV
 fgGIgeDrUBzj8KmzcEAuBdq+dUwAsh72QbU2QLWLWbxEMdBouMJu9kZplevVglwandVjVMrF7VB
 DKg2QeGSgOrU0sGB6+cevPeQNZypMO5ucr7CjKvb9ZkhTfWP3wGPG4G75tOGVxON4HJw1vZlJK+
 l1Zb4SjRvIcwHfaYZzYBdUD0hiI7K1RmL5fONH88JZPI4o9Tn6hiehFgCFP4Q15GAHFSqdm3W/i
 iuGiHZyx72SlDUsGLNGs7PNIGPkiQXN7Re426RYikcCOuKxdKZHDoc6m9kWI9gHQfzH6Jrtu78P
 LwjLItAaCm0k8eiJgLA==
X-Proofpoint-GUID: 4jB9Vn3H54TlSlOHpAILHitgK194UZfs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-21_04,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603210122
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30053-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,renesas.com,kernel.org,google.com,glider.be,valinux.co.jp];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 72E322E5D90
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 06 Mar 2026 00:10:50 +0900, Koichiro Den wrote:
> R-Car S4 Series (R8A779F[4-7]*) uses a 4K minimum iATU region size
> (CX_ATU_MIN_REGION_SIZE = 4K) as per R19UH0161EJ0130 Rev.1.30. The
> DesignWare parameter itself can only be configured in the range 4 kB to
> 64 kB, so the current 1 MB alignment requirement is incorrect.
> 
> Update the advertised EPC BAR alignment to 4K, as described in
> commit 2a9a801620ef ("PCI: endpoint: Add support to specify alignment
> for buffers allocated to BARs").
> 
> [...]

Applied, thanks!

[1/1] PCI: dwc: rcar-gen4: Use 4K EPC BAR alignment
      commit: 380627b3a5ec51a7fdfa156c14af5022980d6333

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>



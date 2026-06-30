Return-Path: <linux-renesas-soc+bounces-34568-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WEIOG1TTQ2qQjgoAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34568-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 16:31:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1796E5757
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 16:31:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IBOFsgGb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WFTMIDzl;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34568-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34568-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3981D30444F8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 14:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A6164266B2;
	Tue, 30 Jun 2026 14:27:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F79367293
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jun 2026 14:27:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782829677; cv=none; b=PooEkMuZ3jgK1/k4glAK9Oud784rgwD0iylf/ogDKA4wTbNeP1A8nIf+gpneWPTkGtLUsOeLD347a0DbxP7rLtRcRJO3zwfFj09OPfFLeHEhGgdgJAnJtgiZN1Az9Z+B4z5HCljJpTcZIbxvBSy5PnF+vu6x/HsFb/8y+oc/wnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782829677; c=relaxed/simple;
	bh=ohIgmR0mYCbPCube/lf9WDIrNuXt9646cuatsuA7c2k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TLza2sG5ADJMgaqZqU2G3lcMpPnRV3RdSPHDxCEg4q2WgLJ0pJSB7CtEJoGfY0FNBY8faaaLIWNNczYJ2LZJZUXoW0YAQwhUUvyg7tzQ02XtbZpWGCVE5pVvnn9OiiHGBJAPSnoodwx3yUc+KeUiz6osBO/zuAR/k8FIplFBbfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IBOFsgGb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WFTMIDzl; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEDGme2209647
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jun 2026 14:27:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sZPoDywCNwFTIMKzJKOShHepkzGRvIYESnrp+JhqWPI=; b=IBOFsgGby1XPNUw5
	aIBeHGXi4nZ4B+FVFabNOqgQTa4DacN8dpLt0jt2VYxB1479UQVDeUUbNBM0S8++
	YdNMzPaDnn4uql5GH+RgKyQJx/RVua8RlfjgiymwEc4kWbF7pNBs1ybE/Zuh7NdR
	yjEmyF5IeJRACj05///WHX87JA+BQ3hUr/FI5CaBkCfVtlaitumDg5e0JPd8mdUB
	NS7XxTpDwhQNgxHUhOLO4y2dnjqHuFKpI5DFDu9OzMo7qK5UN8DxmW5sQiOWGkcP
	nZU3dABPM10ymllGskdlawUAJRZeHUIXB1M8EA+V/gj0Fyi5afFFDEl2PVfRLAsM
	Stq0cg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4avpscfa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jun 2026 14:27:55 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30e773699d6so3272147eec.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jun 2026 07:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782829674; x=1783434474; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sZPoDywCNwFTIMKzJKOShHepkzGRvIYESnrp+JhqWPI=;
        b=WFTMIDzlLjWgIFoWGq/GXwfs0nDYRlWrIthQftNlkXZIOk/TGXnjC7JSL3ZUk1XvuU
         PgwsqvegTaCAUZCvR+JEXhEOCiKO1/a8Ycx4H2FnRTQPLIw3PuHOmYNU4Xcwyu2VKOmN
         J9wWnZgjU/UCBI8ZYVWNis+6ru/rM95aGM93uOv1k1RkdB8d49B/pPWEQB0OYfvri943
         ZhUYoYup5fsV5cKPnU/2toN+3OwrBpvAfODToUk1arbQs5PINKnF1YmQfxQ5v09GhHfZ
         kcYVyq25mMZlabG5NixYbzVDj+fI22h7TQxVGXD4buoibQahm9IKEaSLWX2MiZt7kcvC
         +74g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782829674; x=1783434474;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sZPoDywCNwFTIMKzJKOShHepkzGRvIYESnrp+JhqWPI=;
        b=nsvpM2IilNJf3ntBwk30TDbOi8FW7wQOv/IAyIfZRBexMudPNYMCIDO5N27M2Et/Xb
         ixt8adEC7oeztRxIs3snVk0VMu8f6bzbTasYKKNGAWpp8agIHdycPH+obXzwFkrMiLpZ
         wTuBBrVlRZKx70mTOyHiJEV3ptMrZpHd/9ZGuaI+2lyfO7hHnQakTje7ia60Vwt8gXc3
         EImBWkL0ZF1b9zkGRynPbPWAktyMrt9fNJQow7jm7kT+Sf0uHMksIhBXtUyylsTSd2hT
         CRGu4/aOjuc1xdIox2bFK0u3b1bcYZAhleFPRymnmm98cTRTgyr6AL6OIPCLZMj4/mV8
         y08Q==
X-Gm-Message-State: AOJu0Yy/OMl1QU3TtUoxUVohJyig1j8PHD5XCM9QjS400usfJo0cNHmu
	q8OV3mQur3Z5HvTaTEQifKaLC9T52Oejcq/CXfORQsN7hKj510bLahuCjZnK5I7Oh0JB5PXtnV0
	iJsTWgVMQtlb9j/5jwNMQAT38wOHAoOkjQSTO1w1t5sVKZ0EMKeDK5iDpDqvOerIN+WcjpU/uqA
	==
X-Gm-Gg: AfdE7cnvswXPjA+LWzK0tJagQiqRfBWVb2uyMU5f7orHo1OaksB5YKL+MCUYq1KVY+7
	83PjoD48gmpYCyn9KJShYAhsjOhtmX3eqFjzx0qOw80N7dGMY7bk1U73alEDnk0s0sIVxZNWpk6
	9413TzziqLtvRIxePa8nPCFrQ/tGz78LKzGElEz/vZ5fmSfIiMTxbA+X8cm6+hfvOoYaDIMmtWG
	YkSt6e4wfUeXAgr91mziGGaLtC6SYiQlzwDApxf1Jf3OFE5G7ILZMMc5/z0k3aCUTNtyimwvs02
	IMpKN3XoUctjBCzQPRfIgUyNXS6BidDeXbJopIPhCIjWNj+tsh8HQ2bmb4W4sv8I7HTfVfL4AqI
	HafW8bStki8jRmwvB0N7ODgmKMDtbGA==
X-Received: by 2002:a05:7300:50a:b0:30e:d8ae:3077 with SMTP id 5a478bee46e88-30ee10177edmr2858183eec.0.1782829674031;
        Tue, 30 Jun 2026 07:27:54 -0700 (PDT)
X-Received: by 2002:a05:7300:50a:b0:30e:d8ae:3077 with SMTP id 5a478bee46e88-30ee10177edmr2858091eec.0.1782829672762;
        Tue, 30 Jun 2026 07:27:52 -0700 (PDT)
Received: from QCOM-IvKeorbwK5.na.qualcomm.com ([120.60.61.127])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee3170ef9sm13992508eec.16.2026.06.30.07.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 07:27:52 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, linux-pci@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg+renesas@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260629220932.861445-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260629220932.861445-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v5 0/4] Add PCIe support for RZ/V2H(P) SoC
Message-Id: <178282966564.295664.9943371162356556784.b4-ty@b4>
Date: Tue, 30 Jun 2026 16:27:45 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: zvxeIo87dJ7crSn-0IbarKwt8YV9yjeA
X-Authority-Analysis: v=2.4 cv=KqJ9H2WN c=1 sm=1 tr=0 ts=6a43d26b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=H7IkG6lIOHbWVTtTQWLpKw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=yC-0_ovQAAAA:8 a=7o43ttlTypSgoYAFp-oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEzNiBTYWx0ZWRfXyLTmSz5QaTLC
 hgYpMRVVPus+2a+1I5MImLmsRpPXzLgjNcsDN8XSm894/E35hJNDmkU/7LisYJbbtcJYOaFrLRQ
 yBoUkArB9hDulIicQIo57WbsgIodnPXW56XS4QBQyqFm+DVz+0RYdM2dMbWlqBbSzvBTWCaZGiM
 vOZrIH6QN+nOFUKsVG/WaUEKXDT0Aqql35Wp32VcwbpHFdegzdgUztp4Xo8SX7nYaQzSJU3HDd8
 SfP+M/NtVCYu0wEf7pboX5Olb/5zHG4gERWLwPRZC28mS3lxoB6SbfAWxzgFL9vR3341zZcqyzD
 IYUTGeDkUDSL2laLwRUpGnNrNMMENgxlwDXwpbgwv1p2P8D7tk6PxW5QXwa7YWLzWvy1nwIVlJk
 Q7+WXffmA+N2XIyA1srBZ1/ZEjeOo9W0FSslY4hzsOJWHO9Jx6ZsMRfQTbIt43RHXupEzsFvsif
 kNtaeopjBq7F6uIt6ow==
X-Proofpoint-ORIG-GUID: zvxeIo87dJ7crSn-0IbarKwt8YV9yjeA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEzNiBTYWx0ZWRfX2LqqQ4G4hNi8
 mraF6iJ9voHbpTPMipPEZHHxjzzY9rCbWlYGNXUhXFtIo9/j1asUDN4cCWKRq/5Lolo/9eT07Cv
 hhRQq4Zf65kLX8WOnfBbIPBJ++RZ9xA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300136
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34568-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,bp.renesas.com,google.com,pengutronix.de,glider.be,gmail.com,vger.kernel.org];
	FORGED_SENDER(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:kwilczynski@kernel.org,m:lpieralisi@kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:robh@kernel.org,m:bhelgaas@google.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-pci@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg+renesas@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,renesas.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DC1796E5757


On Mon, 29 Jun 2026 23:09:28 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Hi all,
> 
> This series adds support for the PCIe host controllers found on the
> Renesas RZ/V2H(P) SoCs. The RZ/V2H(P) controller includes additional
> features for PCIe lane control and supports multilink operation with
> two independent controllers.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: PCI: renesas,r9a08g045-pcie: Add RZ/V2H(P) support
      commit: a61588a75d923c5935180e746bfe5f32d7467c5f
[2/4] PCI: rzg3s-host: Use shared reset controls for power domain resets
      commit: e2260454946d4624d4e0f8b55378398c7c6ebf55
[3/4] PCI: rzg3s-host: Prepare System Controller handling for multiple controllers
      commit: 9f2ed7c3de5dc4ccd223784d8ad80909a7bae884
[4/4] PCI: rzg3s-host: Add support for RZ/V2H(P) SoC
      commit: 007c7304d80f1462b98a36284f45adcc1eb8adec

Best regards,
-- 
மணிவண்ணன் சதாசிவம்




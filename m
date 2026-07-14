Return-Path: <linux-renesas-soc+bounces-35186-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kDYqLdEpVmrT0QAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35186-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 14:21:37 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C8D75475E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 14:21:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gmCTbNOv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Bq+aTNBR;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35186-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35186-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0DDC32B8C97
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 12:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05C48393DCD;
	Tue, 14 Jul 2026 12:04:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CCF38F239
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jul 2026 12:04:52 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784030693; cv=pass; b=n/O/vytJglh50bnFBnoz9jUc9T2EMDW1kE9Ngt6w2lPMtR+nDVxTqSxGcBvEarPa0lpsabfnkzG2NwIr7BnCLtSY8tKLedHC1XKkwVStVpQrvPgk2wQvkBNQMfUcQVpYFJCe+Azb8ZZsPGx39I6eIdSPOgBz8ebSRDkcEHCPxgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784030693; c=relaxed/simple;
	bh=IhOcu2PS4sBOU1d9rNLBRpPlon4qfEEhIsBef1KmHjc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mvwAtofcEgvzhpLNX3dRmN59AX8GYJB3mLotWwOu04YWa/Q+X0atqBaMgdeqquX4tdei+T1/VodIauat9Mxq0jaMbl+DuT6ZZcKLtbx0OKfskkaf3ox1X4jPfGAbfjbyzpyX+itGe2z2illFkPilWSsXwcu08cWNjK5yTl7kejE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gmCTbNOv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bq+aTNBR; arc=pass smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBnAMA474787
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jul 2026 12:04:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YAksXXcYTs7qreOl6ykQXBvBHyCNYeVnc316wr7L798=; b=gmCTbNOvkkQQpDE7
	WXD2MuP7stI2PhhR6m9lpRh1z2YICzJdC+2PemJb2sWi5uUH2dHiIzphkM+yoiiB
	59oQY6vUmBuuDkAWRUoJCrSTHgXAtkSc0lQ4mGSWJ8W/Prr43ZWKXLsO6Zz0Y5js
	ZgMzc220iHs2jLL6DiRc1R2dfSn55rxqWZ96fq0JrUB3eYUU0eMytj08MT0X+kN4
	qw4fhvR92SSAtAq3+IKEn2n82M88v91ywjkrkzp6ChZBP2mp7xaQk6Tb9QglSO0A
	9LVAtYSGzjx6fgrcAM7R1iK6nIZlsgbTGvlKy3eDjJGffWkIZKlzuAs4NkHy8VE+
	IQNTiw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdmjq01nx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jul 2026 12:04:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c33f48ee4so66511471cf.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jul 2026 05:04:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784030690; cv=none;
        d=google.com; s=arc-20260327;
        b=GZZebtNIZEM6wXIC8c8CdN33bxZ3VsPvwXXZgnFXcclWvb/OlyoZB2MGDhOgL5BRqd
         5TFlfTugU+ZnVo0lXTe6RUZVJ3tAoLus0wC6WhRiwsUfeuFQCBjGhNCyb6JkIZX5j1dk
         v9Fyi8GTc5EIaPJiz7YYoSNN+l0Z8ARTXAxbY8RKBXBNMWL/1bYlO5Xl0LpiiesushfZ
         E6CUkQBXGEF8zf4GTD3ez3btgrFoW9HaTA0Ft17Rbl9uHfYG/lJQAT/G13clKC1JqjPI
         QtcUTMCZWcqUBwSSiYbtUMEeSsuc0nlcutyO0gNeKqoTFBlTgHYoXMtzsxfPvbLW/lj0
         rM4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YAksXXcYTs7qreOl6ykQXBvBHyCNYeVnc316wr7L798=;
        fh=jws9kAxFFlBHxMixOgUhSVrP8KwxusqHLxnXc/uGhCE=;
        b=oM0x+db/2QXuFie45SqL+4bFgjoyCUJw72eQmJZQH4/dkEo8mX7co5PLix0MglnuOI
         h/7vnkSgcStbPavxgrXW276kaWgY3QzeJNZDnj+Xl6maHSLPNObiXyWrx8J6OgGsAzUD
         dGq4kwLjJvVOsTZ/0VTFwBzrzMMWh7wB5pA+/c3QX38z0V1jmuJVQFnheGUUWYVsjsKO
         5PyVrKjZ3b1kUvckOQvrmBexHmy+lvht9HoQ31Hr0nV8LrGN94QuKUwdbDMg3tIalbm8
         B6CCguj13T9n5vJvFtcVdLQFQRIaSyQl+jnErXT6wLoxjAn5JPwwnD5+0XqyMP9rHvtN
         iJRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784030690; x=1784635490; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YAksXXcYTs7qreOl6ykQXBvBHyCNYeVnc316wr7L798=;
        b=Bq+aTNBRekkBpgaP26yUPGCQewSP1dIbyAOXSeg92wehaX+Qm9ULcLGxcqXU5Zsdvi
         oMX8XO4v0SjMkmzlYsaySCaITYG4p9VG4N2jo3n6NbxYXRYpgfma5Aac64iIq32qJzA0
         CoLuzbgwRKmovI8fGsUjhwUecpibRgWMaykoeA0zRd20pPrxK1/S0fQ2vgSKoEjeI/kb
         FN3kpik/1XJHkQj/6FAoTTV/3p4kqN80wvHAaj3ed58mBnEf7Qv9Rx/x9oncyv5rcVoi
         u4sEOsi9J46ckJhKXgtfrf2Z1H7+icR4WqOwSATXCs6kk9b11EMJCd7zOxKuR+BUIHTi
         iE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784030690; x=1784635490;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YAksXXcYTs7qreOl6ykQXBvBHyCNYeVnc316wr7L798=;
        b=amFmBATpyD0tcvQ8ckbKpD7Naso3PAY53S8W2X9vI0Wq5O6Oddtv1IRTvfhW09UpAR
         w5VEwPOw8x+YOAJPV6OkxQXBi7mVp7gmctVkZuik7kJW9Xe9VNaW3k5Xre8W6J45aATH
         lFkfl7Xhq6Fay2mkB2q8PDVYhLSUmL1zdAt00Z7oEy59xvTAXIEfmKaO2P5S5HrxouE2
         pj0KwFw33Rf2o2H4yJiUBxmIn0bje79Qq5Ut9kg1G2723MXS8hoqGxVVZbDqc+dl++2J
         jEgXaKI63f09nwWFIhP3Ju8jzJSebXnp/yr8mC/27m8Kq8jRUsYGuhmAHeGXR+KtpS/G
         jyEw==
X-Forwarded-Encrypted: i=1; AHgh+RoQrSGEb50mT02JzEkecDfLHRV/sOUokVbx1MbRXfMh6od9XblEfFkAGFf41Lf9xsAPZujVOBazFoAkLMzYVEacLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFgeP0MwdtNZn5kBvrJjqHeCgLHnZBlEQYsovXeJ7EnHFY8SXA
	cqnRMFxyjvwsW6R/EFfvf2MDN/43cYt/r4OYY+5actoc9IhpNmaNvheXJHKhc8qRi0cmF5g494H
	vFr+5IgOrvytDWQ7JkUhhnjtPKfNbguL9yyKaKAbxdWwkXEyJXbB9z59PktyM2Y5Ka24OziGhV+
	SaGTZJPfvnGpwxQrCpwVlN2uvcahdArf29c74jBkM+oxX7ipGv
X-Gm-Gg: AfdE7clVRKsGCNisGEYKJLm2wBcBugpZdllEdgTqNgUurxaE/5nDvgWLwmrDjRtf533
	JcGQJIH3K1DAFF8u3r026cU3OK5uy5qcymOsoJqODlDeRwK88Mp1apLNwCyfx+eH5JXwPxtDqPm
	h/55mApjvaTYUqK2QJX1XJdLdXCqAUgNy3lznINs8AKeokzmNkSqmnd6fb7csVwzWxjmwr
X-Received: by 2002:ac8:5f91:0:b0:51c:7b12:5fff with SMTP id d75a77b69052e-51cbf2ddef5mr127883101cf.75.1784030690541;
        Tue, 14 Jul 2026 05:04:50 -0700 (PDT)
X-Received: by 2002:ac8:5f91:0:b0:51c:7b12:5fff with SMTP id
 d75a77b69052e-51cbf2ddef5mr127882421cf.75.1784030689773; Tue, 14 Jul 2026
 05:04:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783505142.git.geert+renesas@glider.be> <23f979b0903ca11513ac339ab8b6dd40435603c5.1783505142.git.geert+renesas@glider.be>
In-Reply-To: <23f979b0903ca11513ac339ab8b6dd40435603c5.1783505142.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 14:04:38 +0200
X-Gm-Features: AUfX_mz0pm1bKZMzEgKkx0pxSzyNhryLI17GoLwTGSkPYUe4ECmwKPI1jisfYfg
Message-ID: <CAPx+jO-=LF9CvYDrC3O_GBtfHU6GYvq524OLmTG8R1-u27oyKw@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] pmdomain: renesas: Add R-Car X5H MDLC driver
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=LqmiDHdc c=1 sm=1 tr=0 ts=6a5625e3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=UmYWVhtEHbvSSgRh88EA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 1nDyr9EFSKGHa2TIA2aCBGFLG_EuQl_q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEyNSBTYWx0ZWRfX7q40thG6MeRS
 uGaaaplQh0yz8Rc3qzdfa6Ny70Uo45F8I34bM2csD3XV4UM4X19MskiA/gV/Tw2KmSUmV7qCCO+
 ktMUP5cGz4hT2TD79ODZtEEdeEFcsZTV8mRlRLBZ4U+PnyZ+FuDIyNuA3h6xeDR1fPcnHKUjUIe
 AKX2GATC0mYxkfWTyHNd41uT+fu5nhZ0w3ptDlZHrnK4HIhenwEhLC3Cqq1Es7UlKiuiF6IdYA3
 cduycDjmTkAx/2PFpvlL9cXz+veZQpl++9WT6HERIIGWJX8SZnu53ZeahJVMxfRtz/yQpnv6AKD
 jvEdaVoDRMxIulWVh1e/yE7NDVO6GuMkzm7nanz2jRUvHl9x7tk/sBqQy7LUaQ/3vyxXZ5apEb5
 vy1eFbvm1Cnjk2WBncJSc9TQSXRr6hTz7G2UMvsv7jqmtwdR4g6NjRWHkIxHdW6UaW4pNobIPQ8
 AVvwvSNzRBJgBSxTlRw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEyNSBTYWx0ZWRfXy59oEXR81zrs
 OhDGGNYRhgisPndPpVYSXSCFAP/ClKdAN+dX1qRTE5aalSYlESaM8FSoB01ugyhVD5FjqtX82H+
 4q3sl0zl70zm0UP3fq6BW6DuIvnucpA=
X-Proofpoint-ORIG-GUID: 1nDyr9EFSKGHa2TIA2aCBGFLG_EuQl_q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140125
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-35186-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:ulfh@kernel.org,m:p.zabel@pengutronix.de,m:wsa+renesas@sang-engineering.com,m:marek.vasut+renesas@mailbox.org,m:kuninori.morimoto.gx@renesas.com,m:devicetree@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:wsa@sang-engineering.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ulf.hansson@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:dkim,glider.be:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E2C8D75475E

On Wed, Jul 8, 2026 at 12:15=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Add a minimal Module Controller driver for the R-Car X5H (R8A78000) SoC.
> For now this just supports the always-on power domains, and dummy clocks
> and resets for the serial console (which is enabled by the boot loader).
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Calling genpd_add_provider() instead of of_genpd_add_provider_onecell()
> would be sufficient, but the former is private.

Right. Callers that need their own xlate callback should just assign
it before calling of_genpd_add_provider_onecell(), as the below code
does.

>
> v2:
>   - Spin off from "pmdomain: renesas: Add R-Car X5H MDLC SCMI remapping
>     driver",
>   - Add default support not using SCMI,
>   - Drop all SCMI remapping support,
>   - Document use of -1 as a sentinel,
>   - Rename struct r8a78000_mdlc_info to mdlc_info,
>   - Print HW IDs in hexadecimal,
>   - Reduce log level for unsupported MDLC instances from warn to dbg,
> ---
>  drivers/pmdomain/renesas/Kconfig         |   4 +
>  drivers/pmdomain/renesas/Makefile        |   1 +
>  drivers/pmdomain/renesas/r8a78000-mdlc.c | 329 +++++++++++++++++++++++
>  drivers/soc/renesas/Kconfig              |   1 +
>  4 files changed, 335 insertions(+)
>  create mode 100644 drivers/pmdomain/renesas/r8a78000-mdlc.c
>
> diff --git a/drivers/pmdomain/renesas/Kconfig b/drivers/pmdomain/renesas/=
Kconfig
> index b507c3e0d723efc6..f2f52d3c29a083f1 100644
> --- a/drivers/pmdomain/renesas/Kconfig
> +++ b/drivers/pmdomain/renesas/Kconfig
> @@ -13,6 +13,10 @@ config SYSC_RMOBILE
>         bool "System Controller support for R-Mobile" if COMPILE_TEST
>
>  # SoC
> +config MDLC_R8A78000
> +       bool "Module Controller support for R8A78000 (R-Car X5H)" if COMP=
ILE_TEST
> +       select RESET_CONTROLLER
> +
>  config SYSC_R8A7742
>         bool "System Controller support for R8A7742 (RZ/G1H)" if COMPILE_=
TEST
>         select SYSC_RCAR
> diff --git a/drivers/pmdomain/renesas/Makefile b/drivers/pmdomain/renesas=
/Makefile
> index 0391e6e67440a786..17849aad37a5ac4f 100644
> --- a/drivers/pmdomain/renesas/Makefile
> +++ b/drivers/pmdomain/renesas/Makefile
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  # SoC
> +obj-$(CONFIG_MDLC_R8A78000)    +=3D r8a78000-mdlc.o
>  obj-$(CONFIG_SYSC_R8A7742)     +=3D r8a7742-sysc.o
>  obj-$(CONFIG_SYSC_R8A7743)     +=3D r8a7743-sysc.o
>  obj-$(CONFIG_SYSC_R8A7745)     +=3D r8a7745-sysc.o
> diff --git a/drivers/pmdomain/renesas/r8a78000-mdlc.c b/drivers/pmdomain/=
renesas/r8a78000-mdlc.c
> new file mode 100644
> index 0000000000000000..ed367e921a3341a7
> --- /dev/null
> +++ b/drivers/pmdomain/renesas/r8a78000-mdlc.c
> @@ -0,0 +1,329 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * R-Car X5H Module Controller
> + *
> + * Copyright (C) 2026 Glider bv
> + */
> +
> +#include <linux/dev_printk.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
> +#include <linux/reset-controller.h>
> +#include <linux/slab.h>
> +
> +#include <dt-bindings/power/renesas,r8a78000-mdlc.h>
> +
> +struct mod_map {
> +       int hw_id;              /* Hardware module ID or -1 sentinel */
> +};
> +
> +struct mdlc_info {
> +       u32 base;
> +       const struct mod_map *mod_map;
> +};
> +
> +/**
> + * struct r8a78000_mdlc_priv - Module Controller Private Data
> + *
> + * @link: Link into list of MDLC instances
> + * @genpd_data: PM domain provider data
> + * @rcdev: Reset controller entity
> + * @dev: MDLC device
> + * @np: Device node in DT representing the MDLC
> + * @mod_map: Mapping from hardware module IDs
> + */
> +struct r8a78000_mdlc_priv {
> +       struct hlist_node link;
> +       struct genpd_onecell_data genpd_data;
> +       struct reset_controller_dev rcdev;
> +       struct device *dev;
> +       struct device_node *np;
> +       const struct mod_map *mod_map;
> +};
> +
> +static struct generic_pm_domain *r8a78000_genpd_always_on;
> +static HLIST_HEAD(r8a78000_mdlc_list);
> +static DEFINE_MUTEX(r8a78000_mdlc_lock);       /* protects the two above=
 */
> +
> +static struct generic_pm_domain *r8a78000_genpd_xlate(
> +                       const struct of_phandle_args *spec, void *data)
> +{
> +       struct r8a78000_mdlc_priv *priv =3D container_of(data,
> +                                       struct r8a78000_mdlc_priv, genpd_=
data);
> +       struct device *dev =3D priv->dev;
> +       u32 id;
> +
> +       if (spec->args_count !=3D 2)
> +               return ERR_PTR(-EINVAL);
> +
> +       id =3D spec->args[0];
> +
> +       if (id >=3D R8A78000_MDLC_PD_AON) {
> +               dev_dbg(dev,
> +                       "Mapping HW power domain 0x%x to always-on domain=
\n",
> +                       id);
> +               return r8a78000_genpd_always_on;

This looks odd, but perhaps it's just a temporary mapping that you
intend to change later, no?

> +       }
> +
> +       dev_err(dev, "Unknown power domain 0x%x\n", id);
> +       return ERR_PTR(-ENOENT);
> +}

[...]

> +
> +static void r8a78000_genpd_del_provider(void *data)
> +{
> +       of_genpd_del_provider(data);
> +}
> +
> +static int r8a78000_genpd_always_on_singleton(struct device *dev)
> +{
> +       struct generic_pm_domain *genpd;
> +       int ret;
> +
> +       guard(mutex)(&r8a78000_mdlc_lock);
> +
> +       if (r8a78000_genpd_always_on)
> +               return 0;
> +

I guess the mutex is used to protect the global
r8a78000_genpd_always_on, but it looks like that isn't really needed
based upon how things are being called during the probe.

> +       genpd =3D kzalloc_obj(*genpd);
> +       if (!genpd)
> +               return -ENOMEM;
> +
> +       genpd->name =3D "always-on";
> +       genpd->attach_dev =3D r8a78000_mdlc_attach_dev;
> +
> +       ret =3D pm_genpd_init(genpd, &pm_domain_always_on_gov, false);
> +       if (ret) {
> +               kfree(genpd);
> +               return dev_err_probe(dev, ret,
> +                                    "Failed to create always-on domain\n=
");
> +       }
> +
> +       r8a78000_genpd_always_on =3D genpd;
> +       return 0;
> +}
> +
> +static int r8a78000_mdlc_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct device_node *np =3D dev->of_node;
> +       struct r8a78000_mdlc_priv *priv;
> +       const struct mdlc_info *info;
> +       struct resource *res;
> +       int ret;
> +
> +       ret =3D r8a78000_genpd_always_on_singleton(dev);
> +       if (ret)
> +               return ret;
> +
> +       info =3D of_device_get_match_data(dev);
> +       if (!info)
> +               return -ENODEV;
> +
> +       priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       priv->dev =3D dev;
> +       priv->np =3D np;
> +
> +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       if (!res)
> +               return -ENODEV;
> +
> +       for (; info->base; info++) {
> +               if (info->base =3D=3D res->start)
> +                       break;
> +       }
> +
> +       if (!info->base) {
> +               dev_dbg(dev, "Unsupported MDLC instance 0x%pa\n", &res->s=
tart);
> +               return -ENODEV;
> +       }
> +
> +       priv->mod_map =3D info->mod_map;
> +
> +       scoped_guard(mutex, &r8a78000_mdlc_lock) {
> +               hlist_add_head(&priv->link, &r8a78000_mdlc_list);
> +       }
> +
> +       ret =3D devm_add_action_or_reset(dev, r8a78000_mdlc_unlink, priv)=
;
> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to add action\n");
> +
> +       /* Note that no actual domains are registered, just need translat=
ion */
> +       priv->genpd_data.xlate =3D r8a78000_genpd_xlate;
> +       ret =3D of_genpd_add_provider_onecell(np, &priv->genpd_data);
> +       if (ret)
> +               return dev_err_probe(dev, ret,
> +                                    "Failed to register genpd provider\n=
");
> +
> +       ret =3D devm_add_action_or_reset(dev, r8a78000_genpd_del_provider=
, np);
> +       if (ret)
> +               return dev_err_probe(dev, ret,
> +                                    "failed to add unregister action\n")=
;
> +
> +       priv->rcdev.ops =3D &r8a78000_mdlc_reset_ops;
> +       priv->rcdev.of_node =3D np;
> +       priv->rcdev.of_reset_n_cells =3D 1;
> +       priv->rcdev.of_xlate =3D r8a78000_mdlc_reset_xlate;
> +
> +       ret =3D devm_reset_controller_register(dev, &priv->rcdev);
> +       if (ret)
> +               return dev_err_probe(dev, ret,
> +                                    "Failed to register reset controller=
\n");
> +

In some of the error paths above it looks like we end up leaking the
data allocated for r8a78000_genpd_always_on. Perhaps clean up that
somewhere here.

> +       return 0;
> +}

[...]

In regards to the merge strategy, I intend to pick patch 2 (shared via
the immutable dt branch) and $subject patch. Please let me know if
there are any issues with that.

Kind regards
Uffe


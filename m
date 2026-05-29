Return-Path: <linux-renesas-soc+bounces-33353-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKNyHAqrGWodyQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33353-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 17:04:42 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A11F4604366
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 17:04:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 895E83306D96
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 14:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 393BC426D11;
	Fri, 29 May 2026 14:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Egg8Llf1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YDOEaZmV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1944266B1
	for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 14:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780065940; cv=pass; b=W9U+OHZDqU+/X/gImhL7ZLrpuI66/Y6Yz1hP3M/EzeX2hwXUrjVgZ6VWUIVooD3cB7o8u7sffGaCvTx1fZlZYY0643FELrk/EjAq5KvbZvuuzI4mc0NM+nNctYabzLfaO6HqlXSn8y26eOu1QJGaDC/aIdfh1HN9LVtrR2z+UGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780065940; c=relaxed/simple;
	bh=0FD/R2Chz+z68uSQyc5WvBMmasJv65bu8zjMzIs43cs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i6mG5sTZqI4yjh48ve+P//jfl4hkZ8vWVWNWPsefIJOf7892elwJkPLNWwXmkWPJi0KIYAkNHNEnGFt9pn/nByv0QAPM8jYZSUq9r0Fr6G4WtXrVXYsx8u63dgex08m0ONLatI5EfSfTQfZgeHLqqfFnFnbT4rrFq9gabSvYdZo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Egg8Llf1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YDOEaZmV; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDaLaC1279273
	for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 14:45:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Akk87kD5Ki32/Cn7Hfo1mVbYq6dfblJ+R9v4BDvDzc=; b=Egg8Llf1y5qRXnRU
	7Omqk9s1kBWOhbsepAzgj6URAoKcFIheKM4fmSoUr/E7ZXJcd4CRD8WKKv77FwVU
	sI+P8565gIWgDtmzGoyJkHpyoYoUJtcma2ZSOJqCdkUnrafOfczr/Ke3YqfszNjq
	oMPabwZH5/LYXV6z4/E1dt1Oi8AsnH8/xt/2Br11tmI7rq8PevFx/AwpVzokDuXN
	T0ExWIlAQu5XlWPps3uo43xGEZNu5SdhCbOe8D6vwWVFne5LuCwYfkDH2F/TlcaF
	se6lc0Xao/IA2/srmBVFKwhnZ3J5KQpcYPv3b6lO8o1+qECLM+4oCPSdC8Bl4/oB
	YA6Mww==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efbu50a31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 14:45:38 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-63302aca17aso5555237137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 07:45:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780065937; cv=none;
        d=google.com; s=arc-20240605;
        b=DVqSNNuYf1GJSxnVqf0hJolUFndViGdN/uiRakchf0QreooCrAgOTniTghCaeiYThh
         f2vqXObXUtF+LvAdS8Jwh6ksCfBrT8JrQmNXCkbqFcgpXbXcKkVyaYfJgxzVl/srQAlb
         sZFQZK+2IncDeBRUUOqX4sqo0+a6288ULGnayQZODqSUZRwkuG3HJkn9HIyvTqUpU2KM
         rbaSFDxphnfvY0HWDoWZEK0NHL07j6rIOPE0Vi+AxAS+IC5fySKdMAkFiD98u3BEU2hB
         wDBfEu4i1uS1ry9hKIfB+nav4gOOndjnDxddk11aisul6jLaQNu4f12Q1SCHY9Me/o0n
         B2yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5Akk87kD5Ki32/Cn7Hfo1mVbYq6dfblJ+R9v4BDvDzc=;
        fh=xstjlRk5HEzStQTeQDJq+fQ0rEV/Ey0p/y+4cGwU2JM=;
        b=cgEk1d5Qd/z1OK1zkFHTQxsUF9UKb1t4lYb62Dh+dQ8p9BV2sEBXOcFDLMi4ZSf2j8
         UsMg7Zlt5uTao4pPxiL9YvyCBw9z9M6evBehzCcoxiyvaUXdD6lN1xAHTFNdlIE+B9E0
         DfOKRwB36Jkn/4Jrc4uC5UltjaacZiaRfOzCYFzQmv8/9A7scuPj/21U+zPqYl3sMSRe
         FVFLemoqdL6tl32z9rKkBTsfYtwyZD4Psv7+cDzyr4+ZhgS348cgUqhZ2F+getL2ZwqC
         v04bVbP53JWOhSSHKhyhJgM1Gc+kwQFIFfZAguvDepQYTEMXuFJOLPi6LN3hNDYsw9Rr
         9a9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780065937; x=1780670737; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Akk87kD5Ki32/Cn7Hfo1mVbYq6dfblJ+R9v4BDvDzc=;
        b=YDOEaZmV4jgCh4G1RGW57UUinTeECHo4fonPPwxtWsVoqpsgxo1ntwjTildlCliI92
         hq5c0EQmmc/3NNwwjkqsIixN5jyFQpCMfBIAq3zoPWKyRDAPVSshLHjyqESgE7SaUdsC
         tzrowwMrxCb2Zk1a2+ROQYSF2i66Cxqgk1ZhXR5FDaxFPZwJzFvrnMX64obERqYSu13a
         630rScfLJO3t6jQNOaOj4zE9W2t9QFF8WfGH82jkFRpsfPE85hWjH5ako5+U7Bgq2xtN
         6IWqNiT/7UJOnMQTisG0mozhviAUwqVPlOy7fH/veK9tG2dQOzpUJCXudr9tAq8VdRX8
         90/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780065937; x=1780670737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5Akk87kD5Ki32/Cn7Hfo1mVbYq6dfblJ+R9v4BDvDzc=;
        b=TFTvJt4ZgvqNYAFoo0JG4cpnkS8yDzsy76ufEPSEAJ+m6tFTB1tYEbH/33FwHBoYPF
         DuDyo6vqC/UjgL7CrPpDG8hRfe64QJWcjXo0QVvCA8zGLvBxSvJHn2SJVJAJV1hVEG0V
         xmUmK6dHjEm2AVH2l8hHlYwowXo3J06nduARCkw2WZtHet0IG+fzkcZ6OojvRkuSAQog
         Aju0x3wiKxE6mmi/LNMYimSt3YxqGt03BiVL2L5Aghv6f0RNXQVEsMp+jrarwzhB0Dwt
         UvABpRgzrS2P3Z+AzhrGGN3ovj56yYCWOrf/HaOecNXZWISGGVzh5KB9LTrir4XVAQmc
         B2qQ==
X-Forwarded-Encrypted: i=1; AFNElJ+9ZzdImjb+Gv/a66BzFR6ASauqfyLxpQetk/5e3Q6KSJfx9B2xK4K+BFrMGn9PQoHyuOzkh09OU0dGlAvKt0ZMCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk9axyhcqfnU7hMFFUGtARGFC6y3AVFHzvD0RkeauPZFoyOrNg
	Db/mv67H7lIZdDsgYyKHjGXA8Bm7hZkAiuffHLu4iyPh33asAJDGmhCGRKDFAa3un3Eb85AgRPD
	RUN+q5Fc22c9qHBOjt6vR3iVJyi8JG0DT2FoRn8b5qOxNYfrRPMkn0iUBg60ZdYb/gGNzwNLpG4
	XxN+k5yNHEJspXsAzlv0178MMDUpNtyYkn4ElppUkmLfErGfVN
X-Gm-Gg: Acq92OFUv/FcfviaqRp73EbNYvN5637d13pazUnhaWt0cX060d1c/uEoMBjKi5xXEkP
	UCJrU39MJpT5xyG+ss5m5aRrav6ZPtr5lixuArWxwL3sGINTD6qlv+EQ7+ADuqDP2XPzAFcNoPK
	TdIKsPKqvgE75GQLhz+Bx4N/riFVUbPL+O+p6l4hZmbsXfz4y5LEQB0bABiLeNAOReyhIdMB5yU
	QOtEpptzPqLCThBGg==
X-Received: by 2002:a05:6102:4b12:b0:611:17bb:934a with SMTP id ada2fe7eead31-6bf40c9724emr1494912137.28.1780065937386;
        Fri, 29 May 2026 07:45:37 -0700 (PDT)
X-Received: by 2002:a05:6102:4b12:b0:611:17bb:934a with SMTP id
 ada2fe7eead31-6bf40c9724emr1494870137.28.1780065936923; Fri, 29 May 2026
 07:45:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519135342.623943-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260519135342.623943-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260519135342.623943-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 29 May 2026 16:45:25 +0200
X-Gm-Features: AVHnY4IOexYJPhP7I7EbcllbxuZNdWsh4dBC9xk787NW3-6TH27ihnJ6nKWCL8I
Message-ID: <CAPx+jO9H51KZhCkVEeSht3KLNO0La+Zr1Q_+QrDb_zNBxBQUmw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mmc: renesas_sdhi: Add OF entry for RZ/G2E SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulfh@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=SMRykuvH c=1 sm=1 tr=0 ts=6a19a692 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8 a=yC-0_ovQAAAA:8
 a=IpsbscEN6Rrp8biRM4cA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: L0y4hJ0HNdEoyWCn8jzfW1xPt9RtTjsV
X-Proofpoint-ORIG-GUID: L0y4hJ0HNdEoyWCn8jzfW1xPt9RtTjsV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE0NyBTYWx0ZWRfX4L5YncGT/f7s
 Bc8bAd2cMgjcOlHal/tVllt/M2GIIjg9LrgM2Cmf5Ds2/bsw2GKwmjMLJk2OZnDt+Tbea++42in
 s6r3sFHOlJ9nyKbzwYf5fZ28EbLZiKqNHXmTSPEMLtqMbXYmf8FrEjTIZJiENAXLY3iY3fbIyNJ
 B/X1xqjypNAlgpZw/dJ4dcO2OvhHIXCpS75hxQ6xIxc0DVV+cUgWmZdaIP2Lzy5Tcc3G7Px6Wtd
 vqfWeWgSB4ge3uk7aXLgVbbqutVUcm0Nw7GT+YLCZ11oVL8VFv5lBB5SF2XK5s32Y1qntF6+PR+
 OJadYhX4w1bzyhge1ZDRjfhG2e95SkS0/Q1MGtr4FMNaV6aHphNxh4pAnLLlx/RcKKyRwMcV9XS
 53YiB6YEGt/MLqddNJ9dsclc6u+V82jLCHOhm8FFDXq+qwATG42WW9b8AlykRXdXQIr/E3ce28Q
 CGd4U6yd807v5lW6pvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290147
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[sang-engineering.com,kernel.org,glider.be,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	TAGGED_FROM(0.00)[bounces-33353-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: A11F4604366
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 3:53=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The RZ/G2E (R8A774C0) SoC was previously handled via the generic
> "renesas,rcar-gen3-sdhi" fallback compatible string. However, because
> the SDHI IP on RZ/G2E is identical with the R-Car E3 (R8A77990), it
> requires the specific quirks and configuration defined in
> `of_r8a77990_compatible` rather than the generic Gen3 data.
>
> Add the explicit "renesas,sdhi-r8a774c0" match entry to map it correctly.
> Note that the DT binding file renesas,sdhi.yaml does not need an update
> as the entry for this SoC is already present.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
> v1->v2:
> - Dropped adding entry in the quirk list instead added entry
>   in the OF match table to map the SoCs to the existing quirks.
> - Updated commit messages to reflect the above change.
> ---
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/=
host/renesas_sdhi_internal_dmac.c
> index 93470aea21df..024edc4e5fe6 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -280,6 +280,7 @@ static const struct of_device_id renesas_sdhi_interna=
l_dmac_of_match[] =3D {
>         { .compatible =3D "renesas,sdhi-r7s9210", .data =3D &of_rza2_comp=
atible, },
>         { .compatible =3D "renesas,sdhi-mmc-r8a77470", .data =3D &of_rcar=
_gen3_compatible, },
>         { .compatible =3D "renesas,sdhi-r8a774b1", .data =3D &of_r8a77965=
_compatible, },
> +       { .compatible =3D "renesas,sdhi-r8a774c0", .data =3D &of_r8a77990=
_compatible, },
>         { .compatible =3D "renesas,sdhi-r8a774e1", .data =3D &of_r8a7795_=
compatible, },
>         { .compatible =3D "renesas,sdhi-r8a7795", .data =3D &of_r8a7795_c=
ompatible, },
>         { .compatible =3D "renesas,sdhi-r8a77961", .data =3D &of_r8a77961=
_compatible, },
> --
> 2.54.0


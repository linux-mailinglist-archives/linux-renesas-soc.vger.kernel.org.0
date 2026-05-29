Return-Path: <linux-renesas-soc+bounces-33352-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOzwG/eqGWpEyQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33352-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 17:04:23 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E002760433B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 17:04:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C970D338C37C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 14:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 998D2426687;
	Fri, 29 May 2026 14:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VV+jnHXK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Js7Ed/4b"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6E23F0765
	for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 14:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780065936; cv=pass; b=soBM5Yh1pntxq7OmspTdTEw8YNPZ7TadknuG3pF1S5kltS3lfuNs0h+5QErgwF8T5yV89PEygY311by7Oa8yRjNww9OduKpTz4QiOutq6qNJO8dK5tLsu8TvN7tg59aBSnYLMCb3vSVXEx3neY5vUERWuDc6krA2e9QH0Yh8Z00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780065936; c=relaxed/simple;
	bh=YFt/RcByWSmAq3g3/sPtfFzIwvnddj9xL4D5BHnuIus=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t2D8rgBenjqGc8wL2iS4c6Y0CsBzffMQ+clTGDH0QW+Rtfzqfl0cEg9P7EPNgHR8pqfofPcELmgwxv0LtSqBA0Wym3Gc+YkZ1TWrc9ZRDTPqNdTciqMPK/t3IJRPxYlIJNIBf4noPINoXfVDG6z8RTWRMeHA+eLG0LzMhVN9LxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VV+jnHXK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Js7Ed/4b; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDKxkA3729436
	for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 14:45:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nk3TulTpFB5hzCGAN+0Y9okoxS+sLFrZZs6NaYSTC9s=; b=VV+jnHXKUoyzhcjQ
	3byvgF/WxTaLG475C859yAeu2ESZCM9UUtfSN4EPtf1yaei0FNczHXt+Sujl/XH7
	gxkDqLEOjJKIsVIRDMtvmhE3nenbIER1tZ3FRvsQyJ1n3jAg94HFBl8afV2Aso9/
	HPzaoJZBlQt2EzxjnosFul9g87JUGCO3liZ/VlVK8KnN42bpUYa+pwBJmR+yeP3b
	zmJk7EunjM+xSKenc1edXjlXCRq3UzV5FAkQi1W39MTTDIaeDlm7sThRsVFmIMg5
	M7Mksyl6/aDmktRdZsCUeFfovGuuUSZltM1TIfCZEBrjkVHWfiSSBwNme6p+/wKq
	Oi8olQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eety4vn3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 14:45:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-514cbe73d00so357810381cf.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 07:45:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780065933; cv=none;
        d=google.com; s=arc-20240605;
        b=BPIk3oUhYcyg2Yda0lNTnWoemgjHOTGZbMSet/Mh0D5uESmbDu8UTspab7+a4gM6Pa
         34pbiWod9juC2DIRkVjQderQYJHatEiLsCzhugpdMVEz44RYKuHhlXHT3POnSyB58/Ga
         MQt8NOQiJDjtCbOdEVJPQYa9lhd0mssWEb/gL5GdsKR5i0DKLv2I5ZWQz5bndNZldTM2
         1TcSWTtACnoKx9+D6s5cF783ieZSyrelUGugwB9W+xiZqxk2Kx8qgo5G/iENXCOPqYlv
         WgwLB0duBG3gBl3SPHNcGvzMCHXWHGyIdfQNPwsoziC3Y1e+RASQC6R/qE6ER5/GG8HU
         flwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Nk3TulTpFB5hzCGAN+0Y9okoxS+sLFrZZs6NaYSTC9s=;
        fh=2Tc35jQD4o9Ocf86FytDAqb68yPLeQt3oufG+4dmI4k=;
        b=lntMyLHZra2MR3vl6GnPnhBLsKt+wNwBBhNt3AQZM0kkAXB7Uy2NBPI10S08mxHMNM
         RiRwhD3hdM7jdGF1CCWamutj5lpdUxCNpMWW9x4WQjGuXWtI1X+bosY+slC6FjbkmqIu
         7G2KZIwEg5VPyyCTDn43gRsKm4IiwRgpKeuLTeFAKZYh07YpFFNXRgKYW5QO9JvW4MaP
         B5N6sftrAYhVGVcl1fh05A/dYOmW0BsH49iyYM5IIAYI3b+lzEZW0T7rHcUIwh4p1T+P
         oAY5fIdm4Ge2mSncXkGJ+hhjxn2AbcOH48OWDgb8ceMnje+srOv5SfUyq3bBPh3XoPR+
         FjMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780065933; x=1780670733; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nk3TulTpFB5hzCGAN+0Y9okoxS+sLFrZZs6NaYSTC9s=;
        b=Js7Ed/4bdRGQxS32gYprLHb5TBzabOTLanYyLchrkm3ioRogFxP90uzbzjEambEo0+
         HDJEva6b6AFjaty3OB3LMamwHTTras+ayaHIl+eSBdAkyuM7UTi0vgcI5zsscZP9qqff
         8f7IywaCzKsCfrw4Tuh8iRUct07Djx/VdmZzqqpqwOtinMtV4EJeSzz3TRzF+tHuvdYO
         JW1Gf+qr2eYxdG0E6mDbDXLXNgSQfq/iAlnOuAazdFE7U7YNsSxWG94tKse1c9e71Tgs
         61L7aXLlyWwueK5JkocjES2AseRl7ADMC4fGzHIWA0ApYUu+EyxTxhjnNniLtEoHwxn5
         8O/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780065933; x=1780670733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Nk3TulTpFB5hzCGAN+0Y9okoxS+sLFrZZs6NaYSTC9s=;
        b=jgbBc+0wMOcdvFuabrV9xqa+SSXQ+zju6xGB33zPRvpJiITSY3LqpVaelAQ5N5EGpP
         iQLANlDZES/UC4SAjsVHuzq4ADM2Jcb3/vSGVwpK6LlHfo1HEb75Ibz+pEVEv64rt+qd
         AQ3rm10i6Qo4Ic8db6xvzM28v+bseNbwP4XrZcJBTR8iiar0AqnaRwFhYaIzlQGSd2wY
         W6O6Gtz9pQRu1hT8pe0YXwNhD+Fe+1ZRXhTnVC2s5FFdxsqkt+7zYsyCBJZdUqVEbuCr
         5L+jp1E5OcxQVgz64GxHrKjJv/+tP985JFbGMknEYUNFV3lLUVbN2528ywPenNlS+x/7
         cT2w==
X-Forwarded-Encrypted: i=1; AFNElJ8bxqHePOj+5iNzqrLF4qviszDk6NlV4EnbpZU2qzKdpoz/oCxqXRdH8e9zghskSu2OcmY9vktT3uxTCifjidI3Ew==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmYk9IingM1BxhgkC/WLuOdFQKBry73vv4zZNKb68k6UmoXLho
	YGB9NcmrGz4BYAPN6E/x0EuY+l+a5NFvS1E57U6gDsTlr9z+NpC5ycLb3b8FM9vuwRPPMuNJsxA
	2NrEQXJo9+pYOeEhSNJReKuUb+RW+Oue3aDUc5WooRC0bznXmapR1Jplgh278K0pkskx4XYt6bS
	KC+1cPSYFKBRQBmFPnrtKzLcpb2llQ6g2BZj4cHfShTD6Mf3dT
X-Gm-Gg: Acq92OHvwRjd7vsxjOl9fI6n59S/OX5E05wR4erqyTUN400/TXlHil9qCKTximXTDyA
	MrBiP1gQEMl00cS4CjlEx6aP8H5V0hgedZ3dQ2fHV07RHbUbIHXAn0s+lqUAAsc5WDBVufXq1Vv
	Gbf4QelVj4gr3bTYelruw/0uv9BoXS3kRcdvar8aB0C8WKhcauNPVTStERhMSqNOcDo3nH/l5EZ
	WJzsJtB8VLWM9TD2w==
X-Received: by 2002:ac8:5743:0:b0:516:ed02:c85f with SMTP id d75a77b69052e-5172dc1e4bamr40812651cf.9.1780065933424;
        Fri, 29 May 2026 07:45:33 -0700 (PDT)
X-Received: by 2002:ac8:5743:0:b0:516:ed02:c85f with SMTP id
 d75a77b69052e-5172dc1e4bamr40812101cf.9.1780065932772; Fri, 29 May 2026
 07:45:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519135342.623943-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260519135342.623943-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260519135342.623943-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 29 May 2026 16:45:21 +0200
X-Gm-Features: AVHnY4I5YCSpQfAfiixfYNCiy1oosv1T6PF-Eysuc0TfIAMztbMrhGcG7erBAZQ
Message-ID: <CAPx+jO96EN3hS2fYT_uu=eNwJaUZC-yPPyftsMCHSr7GapM8Lw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] mmc: renesas_sdhi: Add OF entry for RZ/G2N SoC
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
X-Proofpoint-ORIG-GUID: TYCyUy9owfAlS3MYHcNWrAK-BINL3MAZ
X-Proofpoint-GUID: TYCyUy9owfAlS3MYHcNWrAK-BINL3MAZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE0NyBTYWx0ZWRfXysx0TGqg+ZSE
 hRRD6fVZ+0BF1lU6gNxwL/jBCIiUaagLbJrcaMKoUWvc8oDzYRjSbw0eBwbM7/hYHDa72ncZYEu
 PmnWjmz9Nqofc2G/aZg9v8G2SzynabqjK0lrf/MJpeEJV6VuddAujuxsV6AQdb3bytb4d2ODaZP
 4cU/fhK854uUIv0TemcIweiNwpuLJnOZ/q+zSr3RgxTe1uXfSY3WCJV0XNGROlWdEzwYQPOCFXf
 U3d4K0rXejwxJXnyVr0PWvam12cL/eR6TqATyBzltLf+lc2u8t7zICsIkHzssO90XGao2IPZLqC
 vPR2TzM9eBn52By6LfiTLyITXRUX2kdOzIlWltcL39Y8KXkuNWBOStDf+srzdM0/EofYWlIXP1B
 Vd2mArlQAFQYcU6Ni74DiD47MGUJgtDNY/9kkMsU0lv63+ROhKh9Q07SdBVZAWw3CBM5oeF2tdy
 bSwDteJti9diLcMxbXw==
X-Authority-Analysis: v=2.4 cv=S+TpBosP c=1 sm=1 tr=0 ts=6a19a68e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8 a=yC-0_ovQAAAA:8
 a=IpsbscEN6Rrp8biRM4cA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 suspectscore=0
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
	TAGGED_FROM(0.00)[bounces-33352-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Queue-Id: E002760433B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 3:53=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The RZ/G2N (R8A774B1) SoC was previously handled via the generic
> "renesas,rcar-gen3-sdhi" fallback compatible string. However, because
> the SDHI IP on RZ/G2N is identical with the R-Car M3-N (R8A77965), it
> requires the specific quirks and configuration defined in
> `of_r8a77965_compatible` rather than the generic Gen3 data.
>
> Add the explicit "renesas,sdhi-r8a774b1" match entry to map it correctly.
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
> index 1d3cd4c3da1f..93470aea21df 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -279,6 +279,7 @@ static const struct renesas_sdhi_of_data_with_quirks =
of_rza2_compatible =3D {
>  static const struct of_device_id renesas_sdhi_internal_dmac_of_match[] =
=3D {
>         { .compatible =3D "renesas,sdhi-r7s9210", .data =3D &of_rza2_comp=
atible, },
>         { .compatible =3D "renesas,sdhi-mmc-r8a77470", .data =3D &of_rcar=
_gen3_compatible, },
> +       { .compatible =3D "renesas,sdhi-r8a774b1", .data =3D &of_r8a77965=
_compatible, },
>         { .compatible =3D "renesas,sdhi-r8a774e1", .data =3D &of_r8a7795_=
compatible, },
>         { .compatible =3D "renesas,sdhi-r8a7795", .data =3D &of_r8a7795_c=
ompatible, },
>         { .compatible =3D "renesas,sdhi-r8a77961", .data =3D &of_r8a77961=
_compatible, },
> --
> 2.54.0


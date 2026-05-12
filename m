Return-Path: <linux-renesas-soc+bounces-32455-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDWeKBLiAmpEyQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32455-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 10:17:22 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D4551C90C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 10:17:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23FB43007E38
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 08:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F326748C8BB;
	Tue, 12 May 2026 08:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zf6Sx//S"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBF847DD73
	for <linux-renesas-soc@vger.kernel.org>; Tue, 12 May 2026 08:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778573741; cv=pass; b=a0+8ktT4E/KxgftVaML+OhuTHZNLaLo/r3aQbS0ln+vqLoKIrBuIhh7RMAFFRKPRGUc8ZBUk0hwNUE38oXbdeqgQRAHxK+UphyezLOSlAEKZCDDYpVLqg4RH3gcu0tkl64X9ziluaLCp2WOdKd5WKbAyJR2O0saACeYn6bj17cE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778573741; c=relaxed/simple;
	bh=a17JfvfY7Y/XLfxZ92JrjnsFOql4egWb1BtwD/QQ/FY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IdAGZUrxdii2YcVo5jj6AJrsNhltPV4a1M1Q3BNpq0kouKK26Qc9LPtSGesZcSh+txPnKIAUDgO0sw1G9RolWqbpvqRnqYSyy7Vwc0RK9ekU2ueKb8mi+xxaxyPoWJub7ZWZKEoyGVZk3o19PhgMqKovNcy31OGGHIFWqPwtZ6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zf6Sx//S; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43eb05b1875so3054475f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 May 2026 01:15:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778573739; cv=none;
        d=google.com; s=arc-20240605;
        b=QVRucm0QeepOPQ+WIy7InAwPOs7Vyy2Lyj+GZEiVBrbWx/jiosRIPUfX/HtIRSWXeR
         jYq826GG4o+e/meKbeu4YkcPlhlytUqH0b5rEmKLGX80o4WnrJE06eF3feN6YRM8mLGj
         RqSKTM+floXCtNhIqUVxyAbE3qEPWdgb6qX6jGj1W0s7dBmys2PwBCpbU7g3LYc5ZCmN
         9I2Aqd3cD9evfICcgRpKxrsYb5LIo6mFMiGRCsqAIlolIB7eE3Cs4C9KWLTqanLW0HFs
         GdjvVyfoO47g+iGOahvDOIPTA+Pqdu1Gx06SZXPJ7YmMNC5Gd3Zk3hqKsQ0ZWp65SKK0
         s5JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s4KE1DWnczjo3tUySIv2QQL5+IpU6t0WNkEspJKLTh0=;
        fh=j3FalNondifYD+vf9gdFqeMKKsS14CMFGPM223l5CwQ=;
        b=cV4zxhYP+HcfcWqjZhxZZy4uNbgt1cJxs+vXz6nQdx6IbELmKcCpvwqKhXGg8kSthB
         Gzs2l6wi9qgQxif+st6sJYo3vQKmtlXxwBQhjCqljdVcHW1b+kBe/KpRTnWcCosIeZlr
         +Gpew0KZFc7UsRmdTzMfM+GKCUe+eJDhywm4JlysSuBkXKj9zrYI2Uy1Du9SYVAUEAuv
         gKW2y1r7h+wpdZ4Jwx5FYE5wJAMfmHzK/vwp5szNC9EEElR9Rs68dGINEUqkNYLBg2fS
         TNcIw7tRFUvImHMyM9O59aD6ODp1ulj+U8GgbV5qS3Dz/jKG41zy+87I3GIanRv7Qorx
         HSKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778573739; x=1779178539; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s4KE1DWnczjo3tUySIv2QQL5+IpU6t0WNkEspJKLTh0=;
        b=Zf6Sx//SPN7USQRwPfZK8qIrO6GWgDl0qXYvPOEXTCJuY6W9pHLV5fHPSUflyrsD2t
         a4w2wlakNA/ZE8kIAihwSw1yLqc7F55TytljWi0qwG9WDFeVepM0tjgOmEqJrYnCmQgg
         QIYTYDOaW520UYVhXCyNq+ct5IAsJrjC0kTQPnpp9N6JRqHqI89hZZZNCXGAavyFdh03
         Uj8P3pKqXL8dnsDC8i+kjsUSxTIOh8uDlU0zSmBb0NybHixp2J87n+GLlmxUToayFHZP
         WHfkhuETkSD9DGznWzHc+4bANoXQ1gZiOA2quez0YdgaltGifeJslFWUagbPyGs1nl8O
         hbMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778573739; x=1779178539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s4KE1DWnczjo3tUySIv2QQL5+IpU6t0WNkEspJKLTh0=;
        b=MainRz6md25EMfllsycdKK4D4160CsoxHOozX3CMA5l2q/edQAk7fmFyLxLWCWraV3
         9XdAb4H7hri36thB5iUYfyhAblkcVUFXwZ+piwCjq1vUo/2utipeTg0kDq0KgGWg0OWx
         1Xu85bQ+gETDIoE/L7o9Ly7xzgWQpUo+InZAJwQ8LEMg2AxKQvubjs6pBHA2czHzbUER
         8B7ukyVJA0AjfsUnKvpKbU1g26GTBmlElgqGG4tP4X8TTlDlkvpHrx3a6A2swqGmp4v2
         A68hOuzPXYnRmZhnZY20u0rqtxbiSv/5pmJTDpBrnQ0up4iT8n7rkyg895VvGY8W6xCu
         Y0IA==
X-Forwarded-Encrypted: i=1; AFNElJ9fPcr8HsX0ZFaWMO7y1DKgXtcgspg+1xF/zgB7zzaQGg6kBByN18jrxDSoyhkok0o0y6e1shcXbyPgD4WDsOKfGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMSyc8UYIxgH9yP5nZZ6WX16ui5IrxQ5Iwj2ASRVUqrR4CjbMA
	YoQEsVpgZOIFMdSJetW1R3dcCaqdZRhquP29wlXE2t+04crb8Z/hWmiBteTgkvxr+TijgvXbDm5
	1DiAlS/vWIYxrxHOWcnA9WjVXLczJf40=
X-Gm-Gg: Acq92OFmfqNKHHW4M+rN97gGIE5YhmCDPJwacstCu5+i4Pt0wcYfDDSTANRleevCs16
	nNramX5E4LYNwX7p6tw+2sszRGMJ3RMxpljY7rQhQRuD6RwML/IFXJET+/HpE4fQNj/RijerG4A
	fynR4//nlrJnjvr8DTXtkrxlltxtGSWXOZdtdq+dRxqWoXK0y/P+JR2hr9QO0r2BdvmYSf32r/w
	NIUPBvM03WbfiEoKukEbySJOCUVEks0tmyReRbrcpdpCd96r+FwPYk46sYC0X/c/2MxXIVowKZN
	i0cTP+5oin+7o+uRaewf3vhSqhw6b/85ufwlG/YSGYs61/EAL9X5E0wiAzD/GQ4VQbBxIQ==
X-Received: by 2002:a05:6000:186b:b0:43d:68ad:3b7f with SMTP id
 ffacd0b85a97d-4568c19b2a6mr18882279f8f.21.1778573738567; Tue, 12 May 2026
 01:15:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512065428.147375-1-jacopo.mondi@ideasonboard.com>
In-Reply-To: <20260512065428.147375-1-jacopo.mondi@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 12 May 2026 09:15:12 +0100
X-Gm-Features: AVHnY4Lr9Ul8UQGcTryszf_nN8PPSk508PckxycDcRxS9WSQWLesyuJ-3ITAqcI
Message-ID: <CA+V-a8u7ADLO5TfTVMSNAAXqHEg3aH09MQg+TTm1X9U1niAcuQ@mail.gmail.com>
Subject: Re: [PATCH v2] media: rzg2l-cru: Add MAINTAINERS entry
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: F1D4551C90C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32455-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 7:55=E2=80=AFAM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> The CRU was missing a maintainer entry.
> Add it.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>
> ---
> v2:
> - Re-sort entries
> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
Acked-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/MAINTAINERS b/MAINTAINERS
> index f2be8f02dffb..c15d00d4f0e0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22683,6 +22683,15 @@ S:     Supported
>  F:     Documentation/devicetree/bindings/timer/renesas,rz-mtu3.yaml
>  F:     drivers/counter/rz-mtu3-cnt.c
>
> +RENESAS RZ/G2L / RZ/V2H(P) CRU
> +M:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> +M:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> +L:     linux-renesas-soc@vger.kernel.org
> +L:     linux-media@vger.kernel.org
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
> +F:     drivers/media/platform/renesas/rzg2l-cru/
> +
>  RENESAS RZ/T2H / RZ/N2H A/D DRIVER
>  M:     Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
>  L:     linux-iio@vger.kernel.org
> --
> 2.53.0
>
>


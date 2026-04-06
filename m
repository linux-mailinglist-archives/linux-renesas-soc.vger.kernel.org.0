Return-Path: <linux-renesas-soc+bounces-30901-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CID9Gl6u02kQkQcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30901-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Apr 2026 15:00:14 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A543A36D6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Apr 2026 15:00:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4CAC93004DB3
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Apr 2026 13:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE21B370D4B;
	Mon,  6 Apr 2026 13:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VX3W1vq+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F62217AE11
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Apr 2026 13:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775480408; cv=pass; b=mrRY2IO97w3rM8oxOMIU0EtpvEtPSlCBn4xHuIL1alRvOrz4o4RDMwUNEGFAgSNy0p3FCk9T/39grTY5WwG8hyb60tkvwnLGnjqyleIceOlNwlisHXWcNdw0YYMn131X7F/QPFa0tt1iQoWpwo0WII45s1+G7+XExIYti8RFKOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775480408; c=relaxed/simple;
	bh=71WGBGMayEvABBF0fn5IqveJ4CNkW/N5vMCCLU3oCbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JxBalkMo8TNcLjOAVri3KNKyxhDnJg/D60W6oHTO4VhIgfq3TtUJqCKTzTSTb4Ue8t9zvY1Gx7lIYrdaIs0RvyV3u/g283GuEO2mRQO156ZI830JaL1LR0+Hkb9msLoFAfBDMSWs5z1eoIpD5gxb87Tzl9b9ZD5NmJt0vBJg7ug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VX3W1vq+; arc=pass smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8296dabef74so3748142b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Apr 2026 06:00:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775480407; cv=none;
        d=google.com; s=arc-20240605;
        b=eIxorCzMLaSuWBGBa3dhaIF0Wys7TWG72uI80AheDmwyC7p7j+C4AJroRGS4+hGiRl
         JmdMPlpEHvuY3znzcENz5A6dpF5PAHqnXUwTNuLAeBGorIMHgv/4teU3GRuTNkkEggoq
         fj/zj1IfW5IPK3AXlXg4x6NdwPRZx4G/R1bsWVihCN31Ezyj+sOOmm8U46geK9OBWTWS
         9ueGLjYnw9xGjVn/5Se4r//BcTuk+FNmjkoBkzqUKJVbCTIaeRR8IlMriI2Sx/d78vvK
         vsZgs35CQtIY/PyqU3ajZ8kqk1MQHSd8XeUxvDIL99fYOuHWTO1z5iPbyKFz8wHlYY5K
         JAmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RgxYtygl1sS+JwTdfDRJk+SRB6rzeXJ0kjY/bbGJFGA=;
        fh=USTci7UxdGGK97hIhPdwtZKe9BQ5TNiw7EpkC85kU/M=;
        b=RmunQ3GHCHBxxrT9wx1OfyZ0PqyUdd0K6X/XEyI7MpLQASwernHy5HB5ls3In6MeBe
         IgDxfyaDLV2o7ApGfMTjK5lemRCp2yuG7elYqMhrvTPsid5Fzgr3B+2nVJd6JJq2RUM9
         SG4E2FK2m+Qe1DLrbMUoLkElzNepX08ppP0oI6Q+MURRnEWaaQfVbsr4M1ME7SZO2kDi
         JHNYG7DVh3NMRis8jA3RqMnrzu8+K3Ubki03BMBtjKW6qG4T57G9yBkp4jn6/x4o+hrE
         VFtfw3HpIPijozNo/AiE/M7uyk5hRvnit4XTwpqeCIuny93lVNbIytNW/s5dyinh+sot
         rikg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775480407; x=1776085207; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RgxYtygl1sS+JwTdfDRJk+SRB6rzeXJ0kjY/bbGJFGA=;
        b=VX3W1vq+C8i+aS5yB1tc3R5Aso+r/eXIzRVwGkOCo/mSGZ2FnPGx57EsIWXSiUUfFw
         WYmbxcchz3jCFemFzFcN7nR1lDUWmb4Tw6410wAnwUAk2aJ3BSToBlpb0HLKoa9Vr/qc
         uPDvfkPZS+0cdWk30UVgybCO4htmjGSBILG2NgVegvo6OWT9nBa9tga7aotl7K4kzt8G
         mPwGZ33FSHRIppXM1/CL75fFMKEVCrxTS4vdB8qLnJHmFhRHXHuEvJoJQql3+xYZ85oJ
         SPsUSM2DfQh9xSM0tsHNMl2nNPYC71TEGe0lIkO4YFBrptYwf4NzntGwoJe/olQbUMFJ
         PWmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775480407; x=1776085207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RgxYtygl1sS+JwTdfDRJk+SRB6rzeXJ0kjY/bbGJFGA=;
        b=cxpsB1TPCcInkzr7FjpXNZPxWYNAMuOENKB1t9ln/wUf67NNvCOFZO+HJEuSgJfE3c
         hMDW9lbYB8FssXGz4JgcEsIZLba1G0ggabITU5rScn8i7ivq3ot4ksaZgjJUG4A/f3mD
         qHUalodrOszjmTMnkT8zFh52Hspr/HPv/PetHqSPXGH2VMvWxAX9eovpiutOdr0+wnOb
         PtY9NdNsLjic6EZqOgJD3PIeS1Z+xfcuQDmD6r3Yg/YGUePwxrNIMKPHwAzj1XTR8S24
         xAeBCDCNhOyISWMX+2pcro7k6HZ21jimhYpo4UhUtSBOUeyfR+h7e3QlwP2OompBPh66
         6i5w==
X-Forwarded-Encrypted: i=1; AJvYcCXSdeojJYh9oeZz3l3cYtWE2q7nrkPMucWQlUv+JaDjFgyc+/7UCuWJF2swhXtUJbV6J9/n6kCu68Wc2FOlCdH1UQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ9fpRFV1Av8BTfI8XrwKv8ZtizCfHQqgUbyZKoCCzwcm9lrK8
	4Ef9W1HV5V4o6Cb5L3Xt7AaO4pYzesVwUa3J6JrLRuOnLcq/hj2Pgl79puyQuz8uWgQgsdRKh7M
	VehfTJQAvnDifYMkj6rJ7O4I/XcWf7ug=
X-Gm-Gg: AeBDieu7Jdls6sJtTuTYEHkOj2XXvTgYDsI/JslVwAMhvpw6IA0o58tEpTQpcIMOSaB
	fmViHjRIlC9uRRNcdPFEvNoB3bh8TRirOpF3IOnWk32EmiRnisAB3LT3jl3AY6tFrz8fADJXB1H
	2AaYfWgW6DJyEa4DFtWLeixtXEbCFBnMEWDvjbNAMWo8dANO6DN8khnymv6ufcC6WSLNGQYZcr/
	HTkF9r/wIv5K/Zi3Rddy0p6etOmYHJo79Hy3k3UAbNz4ITrQCXXNa3GA2dv87vH1VHWeQux34LE
	W0Ni5C0FLgAbaGsmJ5bU7PSFIxYAzaQD3/Ve+g==
X-Received: by 2002:a05:6a00:18a3:b0:81f:31c3:2e34 with SMTP id
 d2e1a72fcca58-82d0da90bc1mr12334891b3a.25.1775480406401; Mon, 06 Apr 2026
 06:00:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403112655.167593-1-phucduc.bui@gmail.com>
 <20260403112655.167593-2-phucduc.bui@gmail.com> <20260405-ultramarine-orangutan-of-wholeness-bbcc6b@quoll>
In-Reply-To: <20260405-ultramarine-orangutan-of-wholeness-bbcc6b@quoll>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 6 Apr 2026 19:59:54 +0700
X-Gm-Features: AQROBzCHyrvZcOJgbKx4MTiVA2A71CHfHy4r9SQf2vs20ty6n_Z1SVNKWQPD9p8
Message-ID: <CAABR9nFsde-Hxk5cOosv0MeSisck9Aq6cWnNe2PFc-RJq87XUQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: sound: renesas,fsi: Add support for
 multiple clocks
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: kuninori.morimoto.gx@renesas.com, broonie@kernel.org, lgirdwood@gmail.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	geert+renesas@glider.be, magnus.damm@gmail.com, perex@perex.cz, 
	tiwai@suse.com, linux-sound@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30901-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,gmail.com,glider.be,perex.cz,suse.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 67A543A36D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mark, Krzysztof,

Thank you for your reviews. I will fix these in v2:

- Subject Line: Change to ASoC: dt-bindings: renesas,fsi: add support
for multiple clocks to match subsystem style.
- Commit Message: Reformat to 72-75 characters per line and remove
manual line breaks after every sentence.
- YAML Bindings: Properly constrain clocks and clock-names by
following the writing-schema and existing
Renesas sound examples.

I will submit the v2 series shortly.

Best regards,
Phuc

On Sun, Apr 5, 2026 at 2:32=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Fri, Apr 03, 2026 at 06:26:53PM +0700, phucduc.bui@gmail.com wrote:
> > From: bui duc phuc <phucduc.bui@gmail.com>
> >
> > The FSI on r8a7740 requires the SPU clock to be enabled
> > before accessing its registers.
> > Without this clock, register access may lead to a system
> > hang.
> > Add support for the "spu" clock so it can be managed by
> > the driver.
> > The binding is also extended to allow additional clocks,
> > as FSIB may require more clock inputs, while FSIA
> > typically uses fewer.
>
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/su=
bmitting-patches.rst#L597
>
> And not after every sentece, BTW.
>
> > Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> > ---
> >  .../devicetree/bindings/sound/renesas,fsi.yaml       | 12 ++++++++++--
> >  1 file changed, 10 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/renesas,fsi.yaml b=
/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
> > index df91991699a7..225cd8d369bb 100644
> > --- a/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
> > +++ b/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
> > @@ -38,7 +38,11 @@ properties:
> >      maxItems: 1
> >
> >    clocks:
> > -    maxItems: 1
> > +    minItems: 1
> > +    maxItems: 8
>
> Needs valid descriptions.
>
> > +
> > +  clock-names:
> > +    description: List of necessary clock names.
>
> Instead constrain it. See also writing-bindings, writing-schema or
> example-schema documents.
>
> Best regards,
> Krzysztof
>


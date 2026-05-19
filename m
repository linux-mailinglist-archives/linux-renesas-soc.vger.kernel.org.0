Return-Path: <linux-renesas-soc+bounces-32809-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BbiJRhpDGo8hQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32809-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 15:43:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3237857FE8A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 15:43:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE7FE3055D61
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 13:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96919348C7F;
	Tue, 19 May 2026 13:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eBUMJ0D5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBA6352009
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 13:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779197867; cv=pass; b=QKihjBd8hv6lOgMzm5OH7J8DUySsvr4YLCmiCMupHsRW+euVBqZ3e6nOHCwnk40D32vO3nGGugKazGW7rei9su01gy8ev61JywjGzkr3XtcRt9Mc633yZLt86g/JSJ2urmRnoyT6qzRjMbBVfhcv1RzwMFrYX1l+/O4xJkok99Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779197867; c=relaxed/simple;
	bh=a+6vVJmOZ3ZG/v6p+ChaawK/jURoxlUIsJFp9JcF6Eo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UnqNzdc+RKjbPoqrUuWgFXKpbj7komN3PEVYwH/c8qaB6HLNtDXH/kYQ0HLLAJqKas32nE8CNeMUWiSughCuleJf3rA6W98GN1njxMiBy265tm5rzYXq0WCdkL0g9sstgyqS87tXvUENo5orLtF98NuHZ2V4EdAi/INAEbP9vbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eBUMJ0D5; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d76dd4ee8so826173f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 06:37:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779197862; cv=none;
        d=google.com; s=arc-20240605;
        b=acqh/50Q05bFD5filQUTD0vzICMCNQ62FELHtOtssp5yckuadmAZ4ZmgQZUi5MFTo0
         6NaC2Ww/oUkbfSrpJc3dVg3H/IdMRrqJBnRZbMh0gANSg3iiDuCjqeQ9gl3GkMH4ANJI
         4xopZGSe9c4kHhIukVeX9IExdav+HZ80mWkCEo0aTdTpemNRs51hEwsaZFNcb2oIF5AY
         ZRDPlqWWizGboy9jaFRZmXWLz2uH97filfQUx5vQSx2/7zZ6lPS0vMm/x6fACEhuOYOb
         7pG3NqUpAQu9fLUWxxFcUdbhj9MxeMjm4JD2R0HJiOVTIL9OBDoMcGnuF6m+o7WS4EzZ
         muug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+/ja8jc+FHQMYyLaMU5qKpBDmFJx8YQVV0WGsvU+fWE=;
        fh=Es7w35LpS3hVGCNVobzqJAIeSU8RMBTsQsPHngeAwvQ=;
        b=Q2IjplHnpN+Fg/US7qrpptY0NQmejgJ9VAgyq6HW+Qt33H99pZC146dsqc4gFdsoBD
         hziPV5xsEnkaYnSgJYM0eQevc5hQmValED6mUTu8pxPh4r9y9+fm7+oIyEpkbgsMlQCm
         YOA97lbcrxgQs5wVXHRdTSWOyl0o8rtVBQkJt1nHnD9Vlc7VaW1Sd0g45hYhRNuJpbZ1
         iRmjNobsrcVSLP5TK7yeG9V5KCtTACiSLe5VZCX5Y3cy2j/9m4pNCAoQJ+Q5q1i08i0g
         muqoDUxNTriJdGpWkbsQWc+2xNrUxpfwWOIfznk3XwPaKfl2t6M8XjyJh8FOiolRF5xD
         PueQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779197862; x=1779802662; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+/ja8jc+FHQMYyLaMU5qKpBDmFJx8YQVV0WGsvU+fWE=;
        b=eBUMJ0D5qz5yuUY2vA1ejwq6sp99nSXgj5qOPe57Pxoy/dgBM41o2zA3YFlbLk5lS0
         3KO0USOyZnalnhnkLaAJtpU6W0BAR3DF1vnl59RNsypd82qmIQ5VV/wPUKP8ZP/PF3Nk
         QTV7fbSicD61E+ehBaU5uoVgLLWYz10/NPkFtJ7KRIcymmZLGuf30WqmKR0nGf5Er3z6
         Px2QCL6bl+DfbsJQrUJ8vYj8vHt1t8lABrQyJ75Tl3h3I1I2g59IQN3JokcOsVSwpC/S
         Gi0hEV/UqtbVUr8IeB0kS4Q4YTr3LBU03fI/YbY8I6naR8OdX7jOvf4fZbppA+AYP2kQ
         /pgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779197862; x=1779802662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+/ja8jc+FHQMYyLaMU5qKpBDmFJx8YQVV0WGsvU+fWE=;
        b=TTqX7wIw/IaysuGHdpLvcOwo36jjmddHBBTgDLN35t1lkrEyaEGkUWgQt9DNnKOhvl
         oEIilDXVKWWQ1ULhjDAVncFDlO+XEMf8J3R0FYvhOh8uspFG9d1PZgbe/aSRm5tom9nG
         Wyc5vHP4yGt3NGW+L2efLq0BsjDN/rX13hQezF7beqE55YWBuu+psfsJNb+0KyzppVb0
         Mpx/JtQdNbOSzVt/WBBYzAANX4sT5HKlhJBiItpX8TFgYsfI0SWPMCYdRx97BBzuJ/uf
         Uvjb5LzCn9OVQ5h9Trf8ZaBCj5z2yMoDEZFzFT1G55dxi0Hcy/YgdNBsoRWd0TyBnHYQ
         3CWQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Ge2Xf/ofySJn5FJLthGKejgdKBwr1EyY6yOfqGaoa/lOBiINU2aNaCT5H3+KlInHzoP/xPw6Z/JUEEVk5AuGOAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxINu3o3Yo0cLTFVvH0LspF6I1ON+RvQ8Xl6AQGkyA93u4TUCnb
	/xGjyeID4e9kTqCYw+i+sBFM5h4+5pJ/h46wSDrDDWfI2C3etMfKmd1wvXfF1q4q+acc1uc4Owl
	idXbHyx6nrRHGR1OV2RGR0TNljG/pqOw=
X-Gm-Gg: Acq92OEAMGn7zMCSYbeZRrIfk8OaSKy+nG3jLxNr6L/6YxsEmNupGPjlmduS1fcH793
	ZjAv4BjDTZjb2I/mVaU/m1rUxqQ5VlEzB+Nr5sK3xtDfEOICg7Tukm0kK1MfUe/GMQrBhSI1INW
	o6u/TZsejFr/03umjprfi+z4lO/N9LpPFxLWxC5EU1OvJVkp1lMjKvUFvKE4hss3LxNuQVYMPka
	S+h9MCbMrQHT+WM3sKrWY+qG5m/cqGZgjpC8/t+h3tITkVdhfsxi8jphwYJuX0egNh650z0bL0E
	WzA9CcWs/NgW4zgO33TeR54KD1AXzrRoOMqBVBGn8IEgiRzpU24ndY8w0xyhg1koL9E0
X-Received: by 2002:a05:6000:1ace:b0:43b:3b80:6776 with SMTP id
 ffacd0b85a97d-45e5c594c2cmr30428288f8f.30.1779197862459; Tue, 19 May 2026
 06:37:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514212024.1624517-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260514212024.1624517-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXDAJjWGRLQb6jfvzUPAWymmTC3yE89UPyiydykHN4u6w@mail.gmail.com>
In-Reply-To: <CAMuHMdXDAJjWGRLQb6jfvzUPAWymmTC3yE89UPyiydykHN4u6w@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 19 May 2026 14:37:16 +0100
X-Gm-Features: AVHnY4I3urEZt5J-xjsCBTxOrtCMrr3KZW2teP8VKCgNB9fs0VDzkYcmhM5yTss
Message-ID: <CA+V-a8uTXh2ieeBRCQC8Gzg_hCSFVFCOv0S_V+6MoGdX0F4VNA@mail.gmail.com>
Subject: Re: [PATCH 1/3] mmc: renesas_sdhi: Apply bad taps quirk to RZ/G2H
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Ulf Hansson <ulfh@kernel.org>, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32809-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,renesas.com:email,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 3237857FE8A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Geert,

Thank you for the review.

On Mon, May 18, 2026 at 2:07=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, 14 May 2026 at 23:20, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Apply the sdhi_quirks_bad_taps2367 quirk to the RZ/G2H (R8A774E1)
> > SoC.
> >
> > RZ/G2H is identical to the R-Car H3-N (R8A77951), which already uses
> > this quirk to avoid unreliable tuning tap positions. Use the same
> > quirk entry for RZ/G2H to ensure consistent SDHI tuning behaviour.
> >
> > Fixes: 31941342888d ("arm64: dts: renesas: r8a774e1: Add SDHI nodes")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> > +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> > @@ -224,6 +224,7 @@ static const struct renesas_sdhi_quirks sdhi_quirks=
_rzg2l =3D {
> >   */
> >  static const struct soc_device_attribute sdhi_quirks_match[]  =3D {
>
> This array is meant for quirks, i.e. to address issues on specific
> SoC variants that cannot just be identified by the compatible value.
>
Ok, I will drop it from the quirks list.

> >         { .soc_id =3D "r8a774a1", .revision =3D "ES1.[012]", .data =3D =
&sdhi_quirks_4tap_nohs400 },
> > +       { .soc_id =3D "r8a774e1", .data =3D &sdhi_quirks_bad_taps2367 }=
,
>
> Hence I think this should be RZ/G2H should be added to
> renesas_sdhi_internal_dmac_of_match[] instead, referring to
> of_r8a7795_compatible.
>
Ok I will add an entry in  renesas_sdhi_internal_dmac_of_match[] (same
for patches 2 and 3).

Cheers,
Prabhakar


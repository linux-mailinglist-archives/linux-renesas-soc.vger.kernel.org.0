Return-Path: <linux-renesas-soc+bounces-31283-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GUhJkZb32n1RwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31283-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 11:32:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FFE4029CD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 11:32:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B743E3067071
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 09:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47E2433555F;
	Wed, 15 Apr 2026 09:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mGUtTM38"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03022332EC8
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Apr 2026 09:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776245068; cv=pass; b=MagsQJiD3Gy7ZDYCn8/OmdqG8cxGDJYs83nQtzeeKU2xLDAF3tSr+5OoDRkts0Gq73LDpyu4ZS0aDqV75ZQ9XGQrb7HlGjjC2LnmIISbBoOoa5Y6lkJ9KGvVGN0bVEwNcZohOoAu+8IXqq6CW+a4PfZ2xSFnMqAY2nAWSwpyuiE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776245068; c=relaxed/simple;
	bh=dJmT/w8H5lCvqR+3MrDYaPpMRfkvpZilvwhihN3HnHM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iuZ9TEgX5T6GPdr7228K7ByBz80JxUe3W+lcd+Uh6IW+pqgAuhWCM+OCEDeIhC9lVDj62kW3Ut/mwdK5pykDVQNHsrzDS/4WNCbXpJy/AzKBfPJ7Eawwls1vdYJqvByQiTjoGQyCStNZSvHxyq8aDPgkyCsWHcJAKWfSBfy5TGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mGUtTM38; arc=pass smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c79467f124dso1008470a12.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Apr 2026 02:24:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776245066; cv=none;
        d=google.com; s=arc-20240605;
        b=RBeh0enCzY8hUJLd5Yt9p8ymF9R8wU7jhJJDk9AIDsAEWYNCg7w+ecdUkthVSjw+zT
         lXAARAjaMQT8Hru0xiowSIU0xBbt8+VxpC5nHapAUzkh45hzZNoEXrrKmCKzNcGn2iRM
         kuYlXpx4AaSjeFFZFxEj9isDohr1SyRkU850/1NS8Ik+BrAOT/e6TZTuW5BRilaFdwOE
         MUXQaNVPjSbJ5s9HEi2PD83ZiRp1bkNjx7QtnWg4nhL+LMcsWep9OY/RN/2Sip2JoXXh
         xflavIwYpP1jXGZQ0puG08bahof/ffe3GnZnjqY4UCL8xhJlNWh8XCbVSzNEp1jLw9Ay
         /0jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dJmT/w8H5lCvqR+3MrDYaPpMRfkvpZilvwhihN3HnHM=;
        fh=d9fcSLvWhfk6CMJMwJ71FRxXNPu8lUq/l0Lew2DpxIU=;
        b=cyOm/TWDXykzmmvPe7asBRMcsxR6caUtJtL5lI07OPmiQmRFc4v9RhuVGBV8jLhz6x
         8izDGxu4qhgbDNCzd275xV51FeMOK3iFEVhmUSig+Ow/DdZVV2qR7RUoKnYJKt7TCvv+
         FiPcrg+jcRQTsTusaaWNXsHG+Sz3rmJOUNGE7SnCKU4MiiyxvgmqL3Rnsw2CajQo5QfS
         QC+vMRjY3TVSaenwZejqGIAcUbhweIvyzc/C+tAXRKea2kU0rEHHQUdWSnzzBVoplbw2
         YxWqxKdN+biuudCW4Bvf/jrfeqpY42uSKWMHml+xfY3dYmXorMpMrHL9Z29NaTPla5IE
         miRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776245066; x=1776849866; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJmT/w8H5lCvqR+3MrDYaPpMRfkvpZilvwhihN3HnHM=;
        b=mGUtTM38dQjb75GEAeiwxhmUL5NlyG1gzCAw7jlKl6mTO1mfirlejc/yKhKmZ+O6nI
         ldKOi4dJ0NXVmoAGKTc9PhsVHtOlMfsM/BkjIC/pio3hZ5Bgur1iwKMiFSpZ29xnuVGD
         BQ/zweB3qMHtXQhAdG24HQmUDerReb0YDmkwIJ8EdDKFz7X9rKcN7FDhQzKzTyCzBwmY
         IdT0U1PADUwQ8XCXCJG5ssz41n6OpxfbaSnCy9ad1INr4J7sNOCskXLZmyp54h+kOoFk
         p/pQNSRqtqFjjwDtLes5lPtlDrLtMzsLqHRuXypDnx31WdKXyWwLFHRSuzD9xFxi9W3R
         OAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776245066; x=1776849866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dJmT/w8H5lCvqR+3MrDYaPpMRfkvpZilvwhihN3HnHM=;
        b=dK+Sy8ed+Jl6hwBf/cHeaHlUaGAkSGT59pfvy/kMoux4okallr9ZrPUq6p0QPsggGJ
         8+EK57pqCV+dzE8T35Okks8wAa5iVEXZX61StOnka3P2LWdL/tcybXu5PLWNrViVajTM
         25vUjJMViGNOkrH91zYnntr3ymlxUTNPtdACMbooS8CR1jSsiI8E99SqrDHDOzJ2E6Zp
         UnpqMRCv53GrmPIrGONhugPqQBbA6Xn6STCKx23eizHxb7SwLew0WS5njrvO7U5O75tl
         ow+i0cyEf2hfCNQLmZI4lm3O3/bBrfOK9n/Il5RgVLVPiHs6QOPwOIVghwPvmBvAzYRb
         XxNg==
X-Forwarded-Encrypted: i=1; AFNElJ+eKLZki6UwvITUFXzQa+mRpcIDKCsp4eZQMHIC/QzU3COI56vRSeu7Dji5VxC7JBPxBbJ/n9W98C+6TlZeWDAqvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTomyufWwnW8FDeG4LN8XeB7DRf5b+QGqCj1axCUAywtZDEW+k
	mgOB/iqhIGxrvvTXCuaSriGkqlnO0AmyWgX9dZZraFetxxan1e7xiGlDdnQEqiyuGDR+2I8mlkN
	2/a3jrbvJl2AkDn+IWAT0rwO7XgNKjIU=
X-Gm-Gg: AeBDieuONczX7qUDmnpwKuYIgYd1h0QU1A6xGC9u4NPDiJEFM2ToiNYmheHjGyFzhgX
	DGJ+59mCjfbhf88PJnb9px2dS62vby274vhu0W308nwzmaftM3I9Uj5edhW9B/P7KIhn0p9j9YY
	2lFXx88yCmgtrTqCotE0snoAAfBbrMAZGp9olLmXcp+9mo55+N3Xux5qhmfHK4h5jdm0P8hRGr1
	B6lKb4mVHQIDWclH+wCkz09ALD3jcimL+ULqmOpdO4Tc9et0sbN/4wg0zYlXSSv9hOlryESrsuk
	pY7bt8vfewr/KhvBNnSRWshjEG8WSxo2oNIW8hPhawljETac
X-Received: by 2002:a17:903:2cd:b0:2b2:420a:b48a with SMTP id
 d9443c01a7336-2b2d5a5b40emr221045375ad.32.1776245066382; Wed, 15 Apr 2026
 02:24:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413100700.30995-1-phucduc.bui@gmail.com> <20260413100700.30995-5-phucduc.bui@gmail.com>
 <87qzoipdo4.wl-kuninori.morimoto.gx@renesas.com> <CAABR9nERzKW=2vZTWNuTcjz4KuVyc+eaCKBNP6ZGb4UAYw3qUQ@mail.gmail.com>
 <87wly87rgg.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87wly87rgg.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 15 Apr 2026 16:24:14 +0700
X-Gm-Features: AQROBzAxV0vtDPyTesfAsCOTSD6-ZvXhLNdBVP4mPf3ihKDvrCGQY99VGP4P4-k
Message-ID: <CAABR9nHApZ7KWjkeut_2oR+AmstOfbYnVe6ad2W+EaWRGPbt=Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] ASoC: renesas: fsi: refactor clock initialization
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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
	TAGGED_FROM(0.00)[bounces-31283-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,glider.be,perex.cz,suse.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: E3FFE4029CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Morimoto-san,

> Ah, OK.
> So the patch 1) moves fsi_clk_init() and 2) update it.
> It is including many features in 1 patch. Please separate it.
>
> One note here is that /* clock function */ is for all fsi_clk_xxx(),
> so don't move it.

Thank you for your guidance.
I will split this into two separate patches accordingly.

Best regards,
Phuc

On Wed, Apr 15, 2026 at 11:55=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi Bui
>
> > > I have mentioned in previous mail to just move fsi_clk_init(), but wh=
y do
> > > you need to move it ? It works without any issue without moving funct=
ion,
> > > I guess ?
> >
> > I moved fsi_clk_init() below the two functions fsi_clk_set_rate_cpg
> > and fsi_clk_set_rate_external because, inside fsi_clk_init(),
> > I assign these functions to clock->set_rate. Moving the function was
> > necessary to avoid compilation errors.
>
> Ah, OK.
> So the patch 1) moves fsi_clk_init() and 2) update it.
> It is including many features in 1 patch. Please separate it.
>
> One note here is that /* clock function */ is for all fsi_clk_xxx(),
> so don't move it.
>
> > > And why you need to call fsi_clk_init() twice ?
> > The FSI controller has two independent ports (Port A and Port B).
> > Each port requires its own clock resource initialization and configurat=
ion.
>
> Ah, yes indeed.
>
>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto


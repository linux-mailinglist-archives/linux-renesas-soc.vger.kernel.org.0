Return-Path: <linux-renesas-soc+bounces-29096-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLwBD2G3r2mKbwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29096-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 07:17:05 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 90843245C3F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 07:17:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A91E30038E3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 06:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7CB12E285C;
	Tue, 10 Mar 2026 06:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HwS1ehNU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFB531D726
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 06:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773123393; cv=none; b=mF0miuhXhcS5I15Znwa3w/7ojxKN7QwcdP0fe5vhDyuSLAQvPtIHrIPc8HA5/rzV0WvmB/HC45DIq/VyKJ47AE9LZpaNx1eK9mVK7hAIu0cS0Q7gcjmSW6zeMsG01yvh61vkAOEkczDYqkD+kvuZI5BUB/oHJPUeERECpPeTNxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773123393; c=relaxed/simple;
	bh=NhI6oA643rmBAg3KYT86ia+E/Pf+LDBAwNCdXohHikk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VO25lQwuV24gCg9bB6WJsMA7P8aeFKsA2rPD3wnAl77eOt+TfFy2lQqAw61DrB/nkuaYDgm94JfjCK4Yx4m2YSwnfa+U/gCM1brpqQDdR4Odp5961+X1fj1EwRn6q43nYzsCgbIU03Sf170tGxE5chMtyXfGStyOcshyXe0YuG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HwS1ehNU; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso8272790eec.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Mar 2026 23:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773123392; x=1773728192; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s+/i4XWfcbGmIxwJyix2mZgFR0owAbkzFlUtp0W0WII=;
        b=HwS1ehNU8drHfiy2pBF/CrewofP6+T1VxYXDmIWCTimDhsM5oQvN/+u0tpBH0R4UbM
         TtnJpjMO347Qg7WtQ+oc1Do2uvSHPiLlcfu3SyxcKRmMLR7xGNvjs8XXndxr3kv/3Z16
         vU2K8jnEY9sDVf4QTgMqx3E7LGzmLLYYAFDEB/TjjT+lxi1UqVcj5fHIEZg4W2AnZAwS
         oTttxSd5urYSNROBr3uYDB4cY+BQ6wPZ131srHGqzNCm8e/VKHdOj9WXIkFxpKn86+JW
         nszjJW/DSVE9MmYHP3stxRt2y9sFCVtrrxDZwUO6uS2a3jQ5Xb6p0Laww7gG5UqhsUnO
         ZNQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773123392; x=1773728192;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s+/i4XWfcbGmIxwJyix2mZgFR0owAbkzFlUtp0W0WII=;
        b=BaUpGCvyrgZ2vB8Np4msBSd2cuhWs0YLV4cpqXnkjmIx6qd6oguKEGPv98pGrJu85s
         HsZV5oNVDsIu8pXAYVcjnTQffoq+qFa5HtT7f5fX+AwWajiDjaghaG/kjZYqe0iFshpF
         SBNT6rTISf+6gn4UKO7AfrjObkEsYPmA1z4GOlACAewWLfM3AvWn3mPJ2lfzgxvnDLNa
         UDN8f+X+elexxzlMTjB0xkoBhl3WEOCcszPcTebkRWGVtzxgpNco8bNzGaZ0gb/OXcfV
         5C2S4fg5/lSte2PBNKtb31B1hRB0AqDwOPQPsLg984F0n7SRAt4VP0dDo7eTiYMOD6vt
         GLHA==
X-Forwarded-Encrypted: i=1; AJvYcCV8Mjh/DdGIkv2p8kR8IExKgGHY7p7dDRDLUyE/oGTPN7uAkcwFUQJI2dQkD5MkHkJ6hXbmUkkJAbfbzcYZXhtejA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMsVMoO1xeM0JHPnFwuAPb4GTo9+3KfusJgezy5Rd0eQRW25t9
	C07zFjRT7yMHb/BkaaIbkK7mP/MxJJf7l2RznoZPiTTXO3wGVMKmdpro
X-Gm-Gg: ATEYQzy4BSlT8s/3fZ9kI2K0ltgOif7C7MbEm8du7l3DTvDZuTEg6B0wSUCMWMcFZKi
	hdd2+l0Bhytq/9D/4kunZhzzMAWuwZx9a3kLqN3eTJ+FsDhnmSkyHtMJSGjRfQnkS+rYbaC8KCr
	/N9L+HOQVBaRacpPpcCPZZT2LNLWdOZS83yftnis2nqbKcbANEBsQG0JL7v3/aO1FNvBL+o+EOw
	xIMUPWKwDo80strQ8RAOZoWggJOF3n2jfJY7aQUrn9LrGNfbDRU5YVNwkQecjon77AFZK4JVT40
	pCqXIgoE7hfcpam0YyWBvp62xc5eJp2tAOdS7RLE1frLrBlglyIVoXpC+3ljj65rYjhE50I8p9b
	2z7J2NG5wbuudJqV4yHglfgccWkw0WbZlDXQVAHvtSN7BLfH88DNbRcL9gnO+CHgZicsfQokcmU
	iOdONqT9kDZiwDH1wrWeqSHi0jrBnbDVWRLFFUT6Ad1CEisLrTdnhe0eC7vPcgRvRw
X-Received: by 2002:a05:7300:dc88:b0:2be:617:1f3b with SMTP id 5a478bee46e88-2be7a0aa471mr958397eec.5.1773123391485;
        Mon, 09 Mar 2026 23:16:31 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:2a0a:17c2:21e7:dcfb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f984ceasm14385368eec.32.2026.03.09.23.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 23:16:31 -0700 (PDT)
Date: Mon, 9 Mar 2026 23:16:28 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linusw@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: renesas: rza1: normalize return value of
 gpio_get
Message-ID: <aa-3BYKrONKrHvTq@google.com>
References: <aZYnyl-Nf4S1U2yj@google.com>
 <CAD++jLmvck+_UG5cNKLCVs2PJb2zynvhr8EbVbB6cYU9925+Vg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLmvck+_UG5cNKLCVs2PJb2zynvhr8EbVbB6cYU9925+Vg@mail.gmail.com>
X-Rspamd-Queue-Id: 90843245C3F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-29096-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 10:04:15AM +0100, Linus Walleij wrote:
> On Wed, Feb 18, 2026 at 9:58 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> 
> > The GPIO get callback is expected to return 0 or 1 (or a negative error
> > code). Ensure that the value returned by rza1_gpio_get() is normalized
> > to the [0, 1] range.
> >
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> 
> I expect Geert will pick this up, else tell me & I'll queue it.

Geert, will you pick it up please?

Thanks.

-- 
Dmitry


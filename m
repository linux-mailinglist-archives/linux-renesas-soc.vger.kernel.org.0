Return-Path: <linux-renesas-soc+bounces-28657-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJ4ZIYPApWknFgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28657-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 17:53:23 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2061DD483
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 17:53:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 53781302C500
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Mar 2026 16:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BD6E430BB2;
	Mon,  2 Mar 2026 16:32:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86C9373C05
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Mar 2026 16:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772469146; cv=none; b=P2k3uo4p6DF6+AWMEVUoNFd9zfV44ZNZVULMOSFNOfjUtdAylicJAFLb8yzsgmSDd6GWokcd72CwzRf9QYrxCXuZ0EDwq8xkwde400gM1HNa5sEYaKFD9R+/L1a6iGVJn1fHvSDm+Ny6nvIy4tCRfLwP3p59JZes9sirbhxICT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772469146; c=relaxed/simple;
	bh=ZN7ZYA3vRUNHHbGnPhwCvGjNZJR0JyldjOBVcI9neHk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eLGsZTy6js6mhJO0kiRGdPFxjqP4j4VjMw6BRgLvccvfqk31wRJFE8EFm9Ckpd7RbaCQghzq+CDM13KsITbmLq/9DH29nqrxi0w/1+6D+L9JF3gAxk+4/trLs29b2MeZakMR4dJlX6NfX7/YKmVaMtRbGQTFN5DTUyemQ4TfZc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-56a981f44c9so2006379e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Mar 2026 08:32:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772469144; x=1773073944;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=32KLibA2LnxuiBPJQhexbcq4h5vz7CZtFSoqgdy1YZE=;
        b=f8RVLNVcQ0FdQXaAUuhuOJy2VcVBkALyvhTukMaraNlEdrXTIlm9ReWYnC3jxatPFw
         T00HiR/7O4C5WMPaQJDuPYkV+Pbwz32BC40ZUyqmqydwq6zu7fOH1FqwRbwmtag7AzrC
         rlc5LZpE8G8msLwA+ynt+VPGmHS6DUTbhd+Fo9TUHQZn6bSWPW0esx+eEpL+I9GT7JO1
         +UMNx6o5khQntczWhbV4jez62d57Lsn90D3fiBjy6hnF2ujMdcHemlpCtuRKpkjIj9E3
         C2Ltp4jFQ26d5BGS6vvTO+yB8Vx6haN9SYl49roW2O6qIeJ4Uhf4YE6MFuwrDuURBxwk
         qouA==
X-Forwarded-Encrypted: i=1; AJvYcCVwL3FB0fp4hKML2zxeTO3hTfACOAno0w2l4D4zT+DqtO5GmHibNEaoDCgEAQf9yMre/cYMbb8Ki8W0GGzHysm8gg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlEak1JQdzbt2BT2ex+C60fdLfuTaVcOEH4uR03XzmJ2gVxlS6
	Nz3aFPdWe1s7cRaoGe6EOTSwrGXED+fvehXbu+o9gOa1VIIKXzNIUq3gSa385D0q
X-Gm-Gg: ATEYQzwu1L7Bh3VIt9GTFYYIxIY1BxvP+Tlrxi2gpQTB/TTPY+OyTF6Bri6akU1kGl4
	5q2B6pmLL4dEF77uK/m+kk5zutmTaLisEJ4pDu7C2N3YjmGdw/PDnHaYxk9yRQjq5dkAHxecuME
	PweIX/akQMxHoZxHGyVPuT5k1K3LH76FglQ1HiznhKiK+tkOwMUUpBJjO1rd9zUlyFktYul7kVC
	qzFjYPV24d+J4UnS7jCrPtfzS0+4V0slCZsZhSHaYqP31kVRbYzuTxAGAkzWVK8n4CVU08oPwKg
	Xy+hWMBlY8l18WirD3ONhQAgJ6FobtBQstSKQKeTsudliX7a/o6xXUU/8CXUynD0+nnq2NTz5Ip
	tkN2RdnmcsWf4u2fFh0eVGmzzuJSS0Jg1CcW6MpcwSmeN5q5ZOiZSWh5Pt0ZVLPoMlfEplHNYU2
	G9XENa63z4ggS4dEDT4BH6XnDLgf5OEiBLPgXUoCxBVh9tB60jMiPLuFVN7aSP
X-Received: by 2002:a05:6122:8c1c:b0:566:21af:5d78 with SMTP id 71dfb90a1353d-56aa0aadf97mr4960363e0c.10.1772469143653;
        Mon, 02 Mar 2026 08:32:23 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a91bd2291sm16128936e0c.9.2026.03.02.08.32.21
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 08:32:22 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-94ace5d0e39so1365055241.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Mar 2026 08:32:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUymrL976fGSudrcVyvK9cfjQljPCHNM23ioRAf6svBe+FtUNpdoayG//0OcG0PQT+51cAjHyuplIEndUNjEctbnA==@vger.kernel.org
X-Received: by 2002:a05:6102:a4c:b0:5ee:a1e5:6504 with SMTP id
 ada2fe7eead31-5ff3257ef76mr5247593137.36.1772469141709; Mon, 02 Mar 2026
 08:32:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com> <20260223-soc-of-root-v2-8-b45da45903c8@oss.qualcomm.com>
In-Reply-To: <20260223-soc-of-root-v2-8-b45da45903c8@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Mar 2026 17:32:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX-rdzLhOFEJYBXzCYX5jH2E1=ydGWKgNkD0Nqx-tGr4Q@mail.gmail.com>
X-Gm-Features: AaiRm53oB2X0Qg0vbG2fw10FsfcqVt_uYNXkS-NKRd6s-Lft2nvlJyc42VLB5T0
Message-ID: <CAMuHMdX-rdzLhOFEJYBXzCYX5jH2E1=ydGWKgNkD0Nqx-tGr4Q@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] soc: renesas: don't access of_root directly
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Frank Li <Frank.Li@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 6E2061DD483
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,pengutronix.de,gmail.com,glider.be,sholland.org,nxp.com,vger.kernel.org,lists.ozlabs.org,lists.infradead.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-28657-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.574];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,mail.gmail.com:mid,linux-m68k.org:email]
X-Rspamd-Action: no action

Hi Bartosz,

On Mon, 23 Feb 2026 at 14:38, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> Don't access of_root directly as it reduces the build test coverage for
> this driver with COMPILE_TEST=y and OF=n. Use existing helper functions
> to retrieve the relevant information.
>
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

> --- a/drivers/soc/renesas/renesas-soc.c
> +++ b/drivers/soc/renesas/renesas-soc.c

> @@ -468,7 +469,11 @@ static int __init renesas_soc_init(void)
>         const char *soc_id;
>         int ret;
>
> -       match = of_match_node(renesas_socs, of_root);
> +       struct device_node *root __free(device_node) = of_find_node_by_path("/");
> +       if (!root)
> +               return -ENOENT;
> +
> +       match = of_match_node(renesas_socs, root);
>         if (!match)
>                 return -ENODEV;
>

I still find it silly to add a call to of_find_node_by_path().
In your reply to my comment on v1, you said you don't want to add
another helper.

Currently we have two helpers in this area:
  1. of_machine_device_match(), which returns bool, and tells if a
     match is available,
  2. of_machine_get_match_data(), which returns the match data, if a
     match is available.
But there is no helper to return the actual match?
of_machine_device_match() would be fine, if it wouldn't cast the result
to bool...

As there is no cost (binary size-wise) in having the helper that returns
the match, too, I have sent a series[1] to do that. The last patch[2]
is an alternative to this patch, avoiding the need to add a call to
of_find_node_by_path().

[1] "[PATCH 0/7] of: Add and use of_machine_get_match() helper"
    https://lore.kernel.org/cover.1772468323.git.geert+renesas@glider.be
[2] "[PATCH 7/7] soc: renesas: Convert to of_machine_get_match()"
    https://lore.kernel.org/10876b30a8bdb7d1cfcc2f23fb859f2ffea335fe.1772468323.git.geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


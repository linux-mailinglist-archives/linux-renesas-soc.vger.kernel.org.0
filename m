Return-Path: <linux-renesas-soc+bounces-33008-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mECkI3ZbEGqDWgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33008-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:34:46 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1155B53B6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:34:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1B3E3031AD6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 13:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FC403C4B93;
	Fri, 22 May 2026 13:33:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1903C278A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 13:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456806; cv=none; b=diICSv42cubC9DODlvPgBrgw+PsJsPOMEv+neJeydXomwtGG/25046hB0JErTpWcd+fAeIec7dma8FEg4giNBTEgaBfIAQf4+NmaaY3z2xH8dQCPMsgxo0hjK1DYdi1iFaOiWXTmaQAzgYIusWRjcrhoj7Six1jC6xEIRbQNIs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456806; c=relaxed/simple;
	bh=oCVQeqNkgLC+A8DsyABQmEoKPm1VZ97E3MIdW+uHGTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PvOr62sGdgIy6jLCAvAhuTxbz4WYjqhXPlv7fB9K+3fwWb+bNssHQKtFWD2WOqXzbfzsz9nAkTk9tSb+vyZUv1kdyrf0a2aDuiv8877GD7pooL/kcIJSjWjxvKqjiufB5clxNXskEZQdBgkKhGxK8iSxDY/UM5mNYijoJYKXEds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-6314cc192a4so2228013137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:33:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456803; x=1780061603;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zq0bJbefph0AAGvXGgXMgxADCBjnqDWg/GTQ4ba21xY=;
        b=auO9tk7hEQ+OcgzPSGH3GafOWjLxYLARS9t1CR3vc/opG6VNO9WLLPAMzJXUzWtYee
         q28hYpFcE45/wH46ECEKZmU8YcD7wzBpOMRUdkEU975Jb+mpaQzDgXXCh/wnYKknTYSi
         wfA9Xm3XluUH5mMNKC9u68RAf8HLQcKTIVDF45LjGLaCBhzKHqZu6Y5PpiBWYaFD2n3V
         jaZPwO28N5lYxXP6oq9Sv3qDtyMTUGnU27py5i+N93tcrij+ze9NfmTkCH4Rj+FZG2+U
         n5t4AnyIxaALjAKVhsprVBAZJcdND/vA+l5qPG2PJdZDaBVmU9LaqrUZmoHxQcg2VYAc
         Ulzw==
X-Forwarded-Encrypted: i=1; AFNElJ8/PNh++nuOG8/GKj1QFVNQR82NDQDydxtb6ZpHawu0SkY+hng2BPxo7c2Xd7EFvjWjREUSmXMGfWwvrr8cSh0vfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx692k4JbuXMW4NncFWt88COzTLA9I0IPHNfsVWfScHnVoP6gmm
	rvRqR6WnpUPODdwd48h7lXWQmrg/oQx9oVTy1nbh04/gb61RDnO1Jm2rPKOJ6eQElaw=
X-Gm-Gg: Acq92OGj1rMa5C55TOv7oAUWB0i2hsJrc5hhe5u/Yhi0s4YyNprMgzuwzIoqstfwvZm
	nIyGLhU95Az6NU50Q/T8k8eIH14QbJJ0JuZBifdYQGTDBSjx8CeSufgWAtjeeAWodwiqoUHM7mc
	72JBS/exJWUy7Tbs8I/EnUIAK/orNpWmBpQ+eXDN6Q4Zd0Qoc3qLnl554oQhAgWBwvH6H1/5zfk
	MhUzBwk9SidM9PH3AhaVCMmK+qCzTD79/dC8qEdUjvv9dIeZ01f6fcESDqCekm8x//oQ8d+URi0
	FCwulgaMdsbu+seYJQHCXixl+8vwd8aQLCvnbk+s310t264w4/CJoUWDnZdaGg+EcC4lLGjazwB
	wPhUvhYm9fvjNw6S7Sk7TAdqUik94HmtyUOzq3rVwWkolSc2JoOwcrslctaSYF6Ywp0oaXBXSpB
	uvnDk14tmaUrtF0r1TqpXKRj4CAhSoguwWI30XbEkvTTDvUI3LvSGX5wYgSgvO
X-Received: by 2002:a05:6102:1494:b0:636:c0c:4d91 with SMTP id ada2fe7eead31-67c829422b1mr1717322137.28.1779456803380;
        Fri, 22 May 2026 06:33:23 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-67fda9015b0sm1313488137.4.2026.05.22.06.33.18
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:33:19 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-960ae134040so1294721241.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:33:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8qgDDPddkyEj573dWzaCQrWqGS0vk9DptBm93bcwvO6bDabV62+KA5hfdrY3aozwca8SpMhVTtPiyO3VXV8bCXbg==@vger.kernel.org
X-Received: by 2002:a05:6122:a5d1:10b0:586:f3ee:2150 with SMTP id
 71dfb90a1353d-586f3ee2352mr748808e0c.13.1779456797851; Fri, 22 May 2026
 06:33:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504225704.115125-1-marek.vasut+renesas@mailbox.org> <20260504225704.115125-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504225704.115125-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:33:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXU_Ro1GX3XTnh+RR4AngbU6K2GfUP8KbvKXPUUME70YA@mail.gmail.com>
X-Gm-Features: AVHnY4LG46fEPe2Suv0Wt0njTP4x5GX3t7XRY9QQB9dVjdHehcMT_3MRaFGgxVs
Message-ID: <CAMuHMdXU_Ro1GX3XTnh+RR4AngbU6K2GfUP8KbvKXPUUME70YA@mail.gmail.com>
Subject: Re: [PATCH 2/5] arm64: dts: renesas: ebisu: Rename clk-multiplier to clock-controller
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33008-lists,linux-renesas-soc=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: ED1155B53B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 5 May 2026 at 00:57, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Use standard clock-controller node name for the CS2000-CP.
> No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


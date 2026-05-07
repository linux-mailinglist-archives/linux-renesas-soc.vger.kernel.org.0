Return-Path: <linux-renesas-soc+bounces-32208-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YO4VLRpd/GlPOwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32208-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 11:36:26 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 320174E610C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 11:36:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1EFF430156FB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 09:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A08D3C0608;
	Thu,  7 May 2026 09:33:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6AD3ACA6F
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 May 2026 09:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778146385; cv=none; b=ZnIcorjyPNKLBrivWpBYADSISC04RlwtFATuGnaUCsGgodQLzAoJGv3Bs7tmXCAMywbC9jAewJnA3zcLqEWH/Q48ITIm8vgBVfo6g3CZamZgP8K9MFz54Pr99OEPg6wbcyPIDb5F18Key5inAZjn6ZKPZ266xpz0d+ju1dJyaEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778146385; c=relaxed/simple;
	bh=EXL7itBy7SwyvckKg0HkmhYL9VAg/83tgztOvMxg/2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q73nsUvsNLx9l6z5hwo2xKTgDb5BOy2lXVOozXzN7H2uwoo+PqefQLGmbUTEpTud6onIzp24bvUnFA9kT/Ng27cNqVsunTONc2vd/gPyLawGmlMfk3RUQetVmj4BPudtvOqoK+VN88+J7NUFImcRsWsqFT/ynXLLRgmc/E3EvpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-57512a429d1so462458e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2026 02:33:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778146383; x=1778751183;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pg18/DzPAz6n2EUKFraCzWPc1dvLgfrdplVOvzpq5g0=;
        b=B3ync25b8MPXeDL2otEy6JUv8qdYhXAyq5gx6gVed54UU6Qgj91ddDN1Hg6QdfZ1FN
         XfvrZAO5wdpD7uOXe7iKwBLKz/BVfN2LGOrMk/HJ2ZmfuPPp83gk5GGi1t1wCAjddKG5
         00VX2cx/jD3zkqDAevOUD9tqxIcmDkDWOOrZrSHAFhkwW3rEpOv8iMEyG8ftmxrwVwab
         FnM7FTOO1fyn3bjHfHnYl6affryZjffYuKUyjkAo/+aP1SXkzzRiZsYXthU93Ga4NYzx
         JrPa6kGV32IHxGjquBxphhCy0q2c3CfB1AEqmBmZhR5Lr5xMs8iSqyD5rdvh7q6vVe0j
         c1XQ==
X-Forwarded-Encrypted: i=1; AFNElJ9FZzt+p4Z5qycwigAJPQQF0qvGXOsttonEBzc6HeQT33XdeR+46A7ruY/PCb6t9fieFnR3u/yNmOsV7oSdx2iGww==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIkb+Bv2Ddszpol8ohHcFtxPlJsQdRXy3+VlZV66fDPyQii6/r
	HvfX75I6v/rz7OpV1zaNWeyryin8CTYPduaVGi7qWaPjDGaPxhIpC8ZI+dtG9IAC/v8=
X-Gm-Gg: AeBDietjmBdqVDjZ6keKXnXSerZf9gNOhSIcyP6e8MzOhgQOKlolF55j0oZHKf9ZFNT
	03Cm9gUnreIPh3sCa1evDa+oLRK9gEK0pBE/CC4eGrPz0VAOi9jdBQc3YdmGB8dqocKCHkabixk
	fYEL565Z4ENo7vhrL6X2Dsmy588LCi5mz2L4yshsQSct2cxbxMn9t1QXko+bNQ+KbqIvc+Jepk0
	r/JckUFQ0q20m+I00gzsfGBYX4peQYBKwF7EB7PMR92BzsnD6DqLVAm6i5DyAjYDdzyt2p+8394
	7knx7oI7bB4pKavDQ7/pk5kVhbkTlcBAJ1HpGk162CUkROpdysgmve9e61CKud9bB1BSF7RmGjx
	xuexfHnsHRImF+OZvCvu0bDZG3HcvNo1yVBOkitbSo28Wrh0mqUctCHfGHJgFbfrWXs/K4sDMdA
	MQXN0MXDdSbVbTKHDTlsY9SAKC1Q5STIBBZ961zOf8RGXERsZ9DzmEdegdxD/vBnsurYgl0HbS4
	Hc=
X-Received: by 2002:a05:6122:3293:b0:56b:1eb:d396 with SMTP id 71dfb90a1353d-57559680c45mr3905089e0c.14.1778146383012;
        Thu, 07 May 2026 02:33:03 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5752425a19csm8230018e0c.10.2026.05.07.02.33.01
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 02:33:02 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-57512a429d1so462439e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2026 02:33:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/6pMy8bC5wjtlgU7Y2WiwnrIsRnjvDJTbQNhy9K+gaSNoFu+HwObqK1HQ6IZGeQo+Uyuh1Q+x+LuzQNh3BhddXMA==@vger.kernel.org
X-Received: by 2002:a05:6122:da3:b0:56f:b0bd:2276 with SMTP id
 71dfb90a1353d-575591f7b22mr4356016e0c.0.1778146381121; Thu, 07 May 2026
 02:33:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504225515.114986-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504225515.114986-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 May 2026 11:32:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWAdnYVDiMFURqU9G5yuZ+spWcYwDXrawQ_NrL2-djW2Q@mail.gmail.com>
X-Gm-Features: AVHnY4I81FuHD6OzqE5oUv509FsnV6J3hu2KKPzKBtXEztsz99ISGa-m61fGNHM
Message-ID: <CAMuHMdWAdnYVDiMFURqU9G5yuZ+spWcYwDXrawQ_NrL2-djW2Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: ebisu: Sort sound node
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 320174E610C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-32208-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,mail.gmail.com:mid,glider.be:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mailbox.org:email]
X-Rspamd-Action: no action

On Tue, 5 May 2026 at 00:55, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Sort /sound {} node in the correct order alphabetically.
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


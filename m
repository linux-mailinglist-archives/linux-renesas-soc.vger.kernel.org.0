Return-Path: <linux-renesas-soc+bounces-28238-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDa+D6Ltkmml0AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28238-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 11:12:50 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 993FC14241F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 11:12:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C052030010F4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 10:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E52572F745D;
	Mon, 16 Feb 2026 10:12:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70D72F7478
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Feb 2026 10:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771236767; cv=none; b=OoZ9o9wzZDw780gPs18T56ayyCgFsHiDxPfPj94drlbF8CnbRI8X8UVT7N3G5Wcx2OruF6b3rrHTr8GBtRVWn+jh+fbRv45JYSdeF//m3n593AEk2tSC5ocBSm/HfK/wqYJgZP7BudUtKfso5J6ZkprSGQqwyeVOs7PgyeEqDG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771236767; c=relaxed/simple;
	bh=BozujfBMNFOAkBaY8sQBuZ358iA+1CjMFPAb+E4RieI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dFbQZH/apaQIWyQ6GcUGcPgtleNYbat5GvgZI6Yv4kAnbxyOU8p8ftYxYQ/SrGhEkMFBd8v4Pya7So4NhoS81GWpq9OAXxYoGrWAqXe6BPw3ClxFGsk6MKan34onyZvTOvgG5iyalts5Q5jFKEb9G5jg53HL8U6tXH0ZbE/MsV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-948a2d37896so1760375241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Feb 2026 02:12:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771236765; x=1771841565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P13RQBdg6K1Wy1Hr9r4bT32rks9Vl0ToNw0MIIfQKTs=;
        b=TZuqYgyTQOhor8HrPcw7qQ9cO9Iq9tBuEhIZLuxBETYuOxGEg8BAm8+oLeo3xv1eJ8
         pMlZOxqP5mq4bfcy/3QI+a15S/QjJFjMVCfXAenlzl6iP/7vjcsL+Zcjldq/fPT3GEy4
         U2kgRKKzApOva2t5vHvQpTFnX/zJfQL7dfP4h58nKeBdYXCYD5Mdrn75ZCFuzBb/eufm
         lG1UEMqbL9hAPePV6ahyJLaeqIeI4XxOcn6wLmHoRQ5ubjFQX0njDW8R6zvgOQfvsHN4
         m80h3zD2fFz/KUhaj1lF7I7CnO8YHkU9do2ZfS336XzO83uDUTs6lD4kgRuM4l7lCBQE
         TLjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqTbbyfllsPRbwbWDX4yyRJS2BigsPzwmzMZ8q241t1o+BbGHMqjsmtRSQ/wN3eySHqN7EUukzBRCi/ERot4Cemg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ98jno1rg+aw9JIkbRCmq9j83x+VS9/GVfR0aTY15BOJq0nm7
	7t3GI2GeFxecF78IRCub4OZlSe25plIFzzFDYHKGJURYVOlqrXDUrx0NfbqNGgt1
X-Gm-Gg: AZuq6aJ/dsMIkLFSoXCaUvYKVsgmnR/+MwR4u9ElzDgYl0fj2iUpt9XldVjrJYciQId
	dSHKttZNaoD5xRQVuu8P52UkwSEMiwnl/oWyi3R5bG+UuVnbSJKRnG2GVxKGEC+j13aty0a3+rH
	8nkv9Y1ziP3BzIJbTMdGLMEZKuLIuYh2p2AeVGCyvZ3RbGUxClNBoApQKN2Kg+aSav7aCXWXZl/
	Q4IkLZbl41GfK3s6BajVjGyyLSkfbV12HMtI7wXmeiRrTq7k1um6gOipC/ivtkpxXxIEqbTJOSr
	neEEML2vdQjoa6quyKBDD4fUgpevok7vJn6b7e+IWcIKQrPqq3FWU7vZXgKSqSxqk4od+ynQxLR
	CrQG5EWW95bf7fyLQvYz78e8F6/TmOqoEsenQFbRF6jyzoauaDKjNcxTaLaGIswi1fYPX5USady
	kTEtIAkxSIGn4rTpCPlllfVBNSgIA7W4Dr8MOAA5nH4W8mOjfyt5QyIeYi57MuiBZNr6YteBpaJ
	s8=
X-Received: by 2002:a05:6102:6cc:b0:5ef:a164:ebed with SMTP id ada2fe7eead31-5fe2b02135dmr2685673137.43.1771236765274;
        Mon, 16 Feb 2026 02:12:45 -0800 (PST)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5fde8a845ddsm7088536137.10.2026.02.16.02.12.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 02:12:45 -0800 (PST)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56641b5a471so2310230e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Feb 2026 02:12:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV4qgcpVlg/EcDgDnxm8n/ZVwpMrxi3uYZZnuUBoaeyLJmH0qp1lgENXb1paNgFpgnbi61xxzjnsUyI2YQidjxt4Q==@vger.kernel.org
X-Received: by 2002:a05:6122:a03:b0:559:6960:be0d with SMTP id
 71dfb90a1353d-56889c06729mr2290707e0c.13.1771236764971; Mon, 16 Feb 2026
 02:12:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260215225501.6365-1-wsa+renesas@sang-engineering.com>
 <20260215225501.6365-3-wsa+renesas@sang-engineering.com> <6e495cc2-3469-4855-8645-c5633d937f1e@omp.ru>
 <aZLVU9toZRX2vKX7@ninjato>
In-Reply-To: <aZLVU9toZRX2vKX7@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Feb 2026 11:12:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWwJZ4fiNgh4DEGpr85QQrPwyA=F=RFyPq-iGzq=F5qMw@mail.gmail.com>
X-Gm-Features: AaiRm53XX8yh0yo47xtUNtlKS0oVTVKQWhwNHvxvJ08yrbcLBEFD0v6qPau1ZLw
Message-ID: <CAMuHMdWwJZ4fiNgh4DEGpr85QQrPwyA=F=RFyPq-iGzq=F5qMw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 02/13] hwspinlock: add callback to fill private
 data of a hwspinlock
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>, linux-renesas-soc@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, linux-arm-kernel@lists.infradead.org, 
	Bjorn Andersson <andersson@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28238-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux-m68k.org:email]
X-Rspamd-Queue-Id: 993FC14241F
X-Rspamd-Action: no action

Hi Wolfram,

On Mon, 16 Feb 2026 at 09:29, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> >    Don't you break the existing users of this API with this change? I s=
ee
> > you're fixing them up in the followup patches but that's not how it sho=
uld
> > be done -- the compilation shouldn't be broken...
>
> I am not breaking them. The helper is an additional feature and the old
> way still works until patch 8. Until then, all users are converted.
>
> I built tested it :)

Is that the statistically most-used response to that question? ;-)

drivers/hwspinlock/sun6i_hwspinlock.c: In function =E2=80=98sun6i_hwspinloc=
k_probe=E2=80=99:
drivers/hwspinlock/sun6i_hwspinlock.c:182:16: error: too few arguments
to function =E2=80=98devm_hwspin_lock_register=E2=80=99
  182 |         return devm_hwspin_lock_register(&pdev->dev,
priv->bank, &sun6i_hwspinlock_ops,
      |                ^~~~~~~~~~~~~~~~~~~~~~~~~
[...]

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds


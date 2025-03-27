Return-Path: <linux-renesas-soc+bounces-14905-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D4BA72AE8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Mar 2025 08:58:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5A99175053
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Mar 2025 07:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C1CB1FF7D5;
	Thu, 27 Mar 2025 07:57:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F0C4430;
	Thu, 27 Mar 2025 07:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743062277; cv=none; b=HUlGVc2GSh7974DXTzBggOSbmiJ+ETrdvmXJwp3DIVFf3kyUYIxXvBqceLFD9axrPY7PvcHl7RQtV6SidsfbSuD1AMhkXGmoFeB3N4uLj4yMKj9Bu2Q9uKDsAfTz/3kIk8I6Hy+WudcIGtaRNzYL0yh7y92s52Qvuggev9CX7W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743062277; c=relaxed/simple;
	bh=7RZ0/mTAFVUmIMZPmxrGrC0fuvfZpu20UylBzZj5jqI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y8F4yc6F/ZQA3j2oaxJHyYVzUfMPk+Qldnf84yOKXlMEJswYJei+0ck1GHt++kPprSycuU3TCCHNrPpvD67hpza3QvH1akuovJeEbMEVO+8dhRAiCnLxvGtTs8QFm7KPWTGqPZmogqBGZODlVFPkg4QCVJOW2Pb3JE/3iLKU5Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-86d42f08219so302230241.0;
        Thu, 27 Mar 2025 00:57:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743062273; x=1743667073;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RvqKbrtjHiG+l3MSzijKqe8Siipsrja9Kds+eq2Ce3E=;
        b=oNQ+5O/9xaxZjLgCPtKeAbvtToRiedd0ItEDcn8tg8ssoTCAzhk/e5Uj7rOJqFBrg+
         dkBNKEeR62dvaIES0Rx/ulNzabm1VMT6eeOlCpYR0hfsPrvi+ITu+a+0CgVSCXzkabAA
         qLxnsZXkNPd4U2019br+LGtJCUZBWLqHsWJ75jiKreEl2hOj7UttlD0qGUlNPczO2BgP
         fWd5H0NjdnM3Q3DLPGLib2RGs+1+duJitP1FIVgLt45OWKJuf/uWvAt3QElB0oJGLBDi
         ///imOZ6B9KBAMEhQNFG/x6Np0lg1VQwth3wglGKYdDZ4kDCut4Mq0Ohx2salEn6ebA7
         rYpA==
X-Forwarded-Encrypted: i=1; AJvYcCVFuN/jdIQPtuu4eCETo3TQ2Si726d7daYpeInZ0OeV0oUcONvzXeLIHC9bdOEla+aYYqZSj4KwoFed@vger.kernel.org, AJvYcCW2wZNRxkuWPukNlqawzqw3SyHnKHCgNkZWJnhXtpV+BAvRdWDeT0C36HeJpesOMBIWZq+OHhb+UBTlc9OnYph+Md4=@vger.kernel.org, AJvYcCWG9OvTsnZ5Hhk2oYSrlYWlgO3+zaN8SdLvKn3v3xB3DGTzpWGKdj3Ydry23WopcFTiW6U7ogQBONRIFPc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2165pAQwQFu6CKyR4tFFNOyf/52LHQGtP4wQNbH1xwGOumvSA
	f5tPvieFpPnKWW9MIjEXqemvP6WC6p4E3SLyUwN8L21ZwpVARJNTEy33/DTAuEA=
X-Gm-Gg: ASbGncs+ZQ38Nwdmf6A2sSMPQKzpWD1ZvJxHgzdNaCVzWi0Sd4RKEFi8/71jBnGW/bM
	ytlIshMYlsj2HLMGL8XOMPenRvVng2sB8tH7f+dD6HtwS+9lOMfg5gFrc7hoN5Vsl6y149nafeo
	7sij4Y4TmYm0qo9aQ0Y3jfWJXWifko7NJ/1JM5tFJ76WeEM0T8d0HkSXlyvoirxYnInBYZvTtgB
	uZ8eRya0HqoT5uAhMlWnndPDH6rvHz7J1WXu8Ijj0aio3fpslk3wmJeUpRXg+wRDxBZMvf+eWM6
	8NfZnm/0lTCzV+0BOzWJ1cC2VaRsePDrTG1KUp7rvAkq2LWffE7flYTcdXytIG6MbQlYPTfdXsp
	LCyD4ltk=
X-Google-Smtp-Source: AGHT+IH2eCDIKgCSmqf8xH+TgrAKFt2JiJAJYxyOg0wnbNHiPkIiWIC0q6+kNsLeh3w7ES7cP6SM8Q==
X-Received: by 2002:a05:6102:c4d:b0:4c1:924e:1a2a with SMTP id ada2fe7eead31-4c5870bbb9cmr2258856137.25.1743062272573;
        Thu, 27 Mar 2025 00:57:52 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c50bbb2afcsm2750368137.5.2025.03.27.00.57.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 00:57:52 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-86d42f08219so302212241.0;
        Thu, 27 Mar 2025 00:57:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWsAT4mUD7kfMqMp9rkK+puuLSYsnS8ssr0JJSI7ACnG/P9VglrZTdn5dO+HvIQPIGuuw+m5qFsYvIo@vger.kernel.org, AJvYcCWvDj2uUBO1w5eGkm1B2niYBxt2/VlxOwP9ns7VN1JY2rTjhmAycBNNIgK5GeLCXGptG8bfML9RksRf+5M=@vger.kernel.org, AJvYcCX/sOx+p0Mx4DjtF+Jvli0s8mIW7RS9/GNJxgVAf1vU6kgyQBip3KeV5enpitgLQIrlLp2WfhX+8iBodnK5GXxem9s=@vger.kernel.org
X-Received: by 2002:a05:6102:3e8a:b0:4bb:cf25:c5a7 with SMTP id
 ada2fe7eead31-4c586f78607mr2099965137.7.1743062271515; Thu, 27 Mar 2025
 00:57:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326220638.460083-1-ruslan.piasetskyi@gmail.com>
In-Reply-To: <20250326220638.460083-1-ruslan.piasetskyi@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Mar 2025 08:57:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVJqz1MJYTAVx4=4RB7XMJp0_3_GDSrhrfF9ouq98Zp3w@mail.gmail.com>
X-Gm-Features: AQ5f1Jqw7JDJOaREf8xC7ma_ST4IA8O3_gLDa5tGFMTw_ljh6znaLkr8BAw4tfI
Message-ID: <CAMuHMdVJqz1MJYTAVx4=4RB7XMJp0_3_GDSrhrfF9ouq98Zp3w@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: Fix error handling in renesas_sdhi_probe
To: Ruslan Piasetskyi <ruslan.piasetskyi@gmail.com>
Cc: wsa+renesas@sang-engineering.com, ulf.hansson@linaro.org, 
	salauyou.ihar@gmail.com, linux-mmc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ruslan,

On Wed, 26 Mar 2025 at 23:08, Ruslan Piasetskyi
<ruslan.piasetskyi@gmail.com> wrote:
> After moving tmio_mmc_host_probe down, error handling has to be
> adjusted.
>
> Fixes: 74f45de394d9 ("mmc: renesas_sdhi: register irqs before registering controller")
> Reviewed-by: Ihar Salauyou <salauyou.ihar@gmail.com>
> Signed-off-by: Ruslan Piasetskyi <ruslan.piasetskyi@gmail.com>

Thanks for your patch!

Doh, how did I miss that the gotos weren't adjusted?!?...

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


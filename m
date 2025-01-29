Return-Path: <linux-renesas-soc+bounces-12699-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 656C1A21FE9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 16:02:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5ACAE3A5B6F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 15:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACFE918E379;
	Wed, 29 Jan 2025 15:02:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317814C83;
	Wed, 29 Jan 2025 15:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738162927; cv=none; b=BORiRZ7AGF0FHrhwD3yWPgYvAlJ6pNWMiUhH4OtIuy3yCZr1JoD6RHW//ndKeqZvmxQs3yDUqQs8r0iG9OM3qr1Yr9Jw2I1LiQKFcb75Ec81o3CdnvHpv9tH8h1XR6aylpN5rofwFwWVpEoRmOjyQLDaa3Vgfs+pJh1q5+oifWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738162927; c=relaxed/simple;
	bh=20WkvFkSPbBkEEg6YMt3KIoVUIB9A2vbiac6vIrLmq0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MQyV5BZUu41RIJQ0tKtEviLpl0NRL3uk53apwEQAUbiYYV5ErLyQSeqgwM1noMp3dG2m29pv2u4S+Vsm7V7s6Rrs1faRG8hvvR5jJin7XqcheSVVBpZcNWNNKSYulqNkAEfv5ByTckZ4kZ1gUTsEHvbtgEbS00LHrZJ0rZ2JI0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5f2b21a0784so1750679eaf.1;
        Wed, 29 Jan 2025 07:02:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738162923; x=1738767723;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ewE3umzL3gj0XBAqlrJ7IaBFo9LiX+onjG/TWOWg+5I=;
        b=XI1WJLRO+WsBm1i2TxHtHJUsACmyM3barftikKk9c8iuiH6aZtGIlEwJMP7Os2jv9G
         36UH5vtLp87VBtfkabu5nRO4j2s7yvQ3hpHMDq1KU2NygPSNm+1gLM5pSIzP+07z3dQY
         nY4Qe21N6gJWho1nBsASO23PJkw/SUkSc6Yh9nLMGQE4kRQ5hPKSvHPy+JmNsQz1q3lL
         F0KgGBtCiaoQ9/Y8ivkOUvDfhJACo6hOvFs0n3yu3Z9WJohmReRa0wYeNx07uaEpXlZV
         ZG5jAMyx/R+eVvyIWnrdJCg2ZBHGe1ZKR1Hq3Q9CytmgivQCYukCj4FeBE+VhX6iqktS
         KTyw==
X-Forwarded-Encrypted: i=1; AJvYcCUB3hBw+JJo1UsPARXlRndTOqpvBhQeXQB/VSFzC+WSnoGzB87WlJPBHkFlb5tLi8vnNmazmjm+sl0p1w9P@vger.kernel.org, AJvYcCW5nlrQiGYT9snwh4RbPY4qydPf7pcIhHwpVtSVQ97tkozrWu/q1w2pAx+KuoKjbwvAIDqDW5dOTvOd@vger.kernel.org, AJvYcCXVpySaeUD7abSlvG3N6lylL30W4M7Akb+TBzR8WZ+cMdg1Q6n6r4VKH66SMtin26yehD54liMIOpdVM9uqNR72Ap4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwLWN5ASpdNuam4AbwsQMUFbvl+65ih/auvwDiVlyDXIQph1qE
	2ZAVld87n+MTw5cNiqjlThW5keIVBOrRqNCuxQ5EZJ3VXOs/1Y/zf7foccOJ
X-Gm-Gg: ASbGnctq4+nXpAMNvOzFd11N4fejNs4JvTKIxoUe30B4LdQwpt6vuy2UUAxuUGO1ilF
	VbCOtoD/GVNu7OwhRVkVNMjNWVLwigFbIKo0xBs/Hp2b8vzyG0hQw7W8WI3kMlEaeTn/dqY+tf5
	SmVNX5VL68/8LEb4Jk2mQY8woJwA7oRWtof1UIW1On0Svd30k6Ad6wu98ITviXA5JkN11ugGVr7
	ZFZoSdqqr346uuv1O3nhMMiXfsDNGdn2eW81EJEhZ9kk+QrvtWm6qSiPOItXMlwq9KsaniSGxOI
	3iEo5IZWRt5A8XKBhCPh8WL2kxRektc8XhopsNuJOMaLkxUxdUM2MJ2N7g==
X-Google-Smtp-Source: AGHT+IGUJeGOmpxK+Mrp71A9IRLn/KpZQLLJAe1nhU0BuXRqPnZ4On5iINpeLxIlYHFQ1vQi6NxVhA==
X-Received: by 2002:a05:6820:2001:b0:5f9:b840:6bb0 with SMTP id 006d021491bc7-5fc00366950mr2216440eaf.6.1738162923151;
        Wed, 29 Jan 2025 07:02:03 -0800 (PST)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com. [209.85.167.175])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-724ecf9cf6fsm3773611a34.62.2025.01.29.07.02.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 07:02:02 -0800 (PST)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3eb9ba53f90so1871182b6e.1;
        Wed, 29 Jan 2025 07:02:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVDcb5pNdOsxi+v2W6huP78u2FwX1jOyczjQk2dcpfq39s3PIhvjTgJZbgdffBh5oD1z34D4LtqhVUwHo12iqUjpM4=@vger.kernel.org, AJvYcCW1O3yEboEet7OWEtaDJYDsTozyyxvHUuThex/C/SlHrTvEgbeeu38aQiFXwEU9wUDpaDyAsqVP+gK4@vger.kernel.org, AJvYcCWy8KdCGI1v+bu0BQkUDW9+Zm6gwkFAnv5NzYOdCB0qvph9r6W6ABj+lmYIp7yamRgAUh4kMFI2MuIHJDdu@vger.kernel.org
X-Received: by 2002:a05:6808:3a0e:b0:3ea:57cf:7c26 with SMTP id
 5614622812f47-3f323a73eb7mr2107120b6e.19.1738162921882; Wed, 29 Jan 2025
 07:02:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250128031342.52675-1-john.madieu.xa@bp.renesas.com> <20250128031342.52675-6-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20250128031342.52675-6-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Jan 2025 16:01:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWTe+nDo-T_ExHzpR4kun6dLUf5dk0itx48odS6kvxxYA@mail.gmail.com>
X-Gm-Features: AWEUYZlucVpmewkLx03dFtQUqk0uwPxTAUuXfrbRoD_9-IH5pjUXbLJjvr0J9xw
Message-ID: <CAMuHMdWTe+nDo-T_ExHzpR4kun6dLUf5dk0itx48odS6kvxxYA@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] soc: renesas: rzv2h: Add a callback to print
 SoC-specific extra features
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, biju.das.jz@bp.renesas.com, 
	claudiu.beznea.uj@bp.renesas.com, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, john.madieu@gmail.com, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	magnus.damm@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 28 Jan 2025 at 04:14, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Some RZ/V2H SoC variants feature a Mali-G31 (GPU) and/or a Mali-C55 (ISP)
> IP(s). Detect and inform about their presence during SoC identification.
> Also detect PLL frequency and warn in case of mismatch.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
> Changes:
>
> v5: Use proper hex value to populate rzv2h_sys_soc_id_init_data and put as much
>     variable as possible on the same line while printing messages

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.15.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


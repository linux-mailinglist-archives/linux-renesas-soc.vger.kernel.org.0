Return-Path: <linux-renesas-soc+bounces-13217-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7F2A38366
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2025 13:50:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2ED9F1722CC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2025 12:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AB8721B190;
	Mon, 17 Feb 2025 12:50:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84B8218E85;
	Mon, 17 Feb 2025 12:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739796618; cv=none; b=T0f8Pv1ZajEbrMTXX9GnxmzPzYHI0zUVGi1mElI191t+CLLQcKq/vKjXTLhDtU1dpkEzgUU2PpOhRNOR9+bhNjjRH2H72DJldK7Z+MU0ftkdZU/2ihbU6N825K+oZ3gcmgg4NofZ8P24xYQC/hQZREKvefj+5sC/HHnrly6dr+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739796618; c=relaxed/simple;
	bh=0RhyFH1b+cX0AveXfK2m4yH/3a+05G0yhsjknrg3JVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gSZHYW81y4DrhHEo/UICLLhMjnsshfWLm1tybRzQq8MIzBHke8skPDeJEpoYIworos01CRF2PGwn097+7yEGYKKt+uSw0S+vuxLQkVN6SbczulyqNfU2/kTHOA7nX049R7DnRHLiYy19rcrmpcT74P1D+iFt37GuR7pY60U2sOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5ded368fcd9so5399221a12.1;
        Mon, 17 Feb 2025 04:50:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739796614; x=1740401414;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eo3LTqAK5foIYu3azQeBOFZjViFoAJDbqBz1QO4a0U0=;
        b=T4t2iHXPauuTwPeL6UNerXDsroRehcG3D3cyFTp7Ua4ufrETxqIugtX/vYlurQQTjh
         UjpIQN8OpPSq4JkaUipmia4RkC2FukxVt41LSspk+Lf04ilAZkypznqqGLrLI9QumZ7d
         5QyRJZ0IiOGD1mczKnQZvICsBlrB4ZSpT8hN8DIZHQlgEJVaM/JZ+KEForHJSpmOHdL+
         KRFsz+7scysv+wqHH9fjdDsNNsZBvtwQ2ZJPvpepDeeagtfMNp3eo8jRkNt5rlZLRNAJ
         h05oztLbO/ywjoLiempQsTYnooucUFCKQyd0hYq4Z/potAI8T4pscveQrzyJqnNeYcbU
         288Q==
X-Forwarded-Encrypted: i=1; AJvYcCUTUMGsJhaTdWc3X8F0npb+td6JbfMFz5AhNIwqwCc8NwEJtHprS9URDe9gkaCKg85s9miu1QardiG05AE=@vger.kernel.org, AJvYcCUv3gU9IGimKrkKxYU1yEbzm/s1kHwGNeEmryu8Fz81+zW7K+cCYGy/vPhHWr7HCkb4/dm90NAg2bMdsfhF/ZTyc2I=@vger.kernel.org, AJvYcCWeiJGVU0r2Igqcmvny5qJlQpWx1cBpITBbkdrb910SkwK52O4ZwRGmKLyrmSix/zXOzix3xcM8bdGaB0Qw@vger.kernel.org
X-Gm-Message-State: AOJu0Yw895SEda3NOWOSN9eUIcYbxHrNE4XNUUkxN+Ar17ZOtJjwJBAE
	AI10GyVe5CK0l6nKv1TZXIjikSEMAPK9Up+21/q/vlq3cfFVyFGyKIRwRfXHHAg=
X-Gm-Gg: ASbGncvYRiXlbToSGocOgnWhdfbn6ZrC8d4m4hS+8SigttHqkyd/6FayOhgb+iJMwld
	CxdIsuxe6iD9YlhIxuJeg6Rl5+lkO3TxCsXV0hacuHo9BqWGQwn7fn7jCBOlZ62DsJ5teKr7LMk
	ffyn16DcoPY1En4B/zTSALJRzOmA8TiLEn963q4Gu+P1OK2jriebPQoh49IXoYfm9kzQiNetazf
	STBPl/hMBib7kd2DSaRbBUJMzmeB3mJNOj9LaN/rAF4VQslCRrsqmzVUl+/Ks6EMpiKezI2Q1lK
	H61p+1jsz5iJnopxyqwH/qU/AOd3dzBZmgHshFxRhRmYgK/uQdjyZA==
X-Google-Smtp-Source: AGHT+IG6lmtCjHGE/FLssmYUDlaRpS2CZzi/oorHFse8WHLPcYNc/HRg1SLOz6yNFARDyhGrmrzOOQ==
X-Received: by 2002:a17:907:2da0:b0:ab7:bcf9:34f with SMTP id a640c23a62f3a-abb70ab858emr974811766b.15.1739796614166;
        Mon, 17 Feb 2025 04:50:14 -0800 (PST)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb91e9d96bsm277486766b.122.2025.02.17.04.50.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 04:50:13 -0800 (PST)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-abb7520028bso229258166b.3;
        Mon, 17 Feb 2025 04:50:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUT0tgqrdbxPlXYJhY3lJ1kZ30KoEIG17Km6TVwPosFg/HIwI6INhakxDw8ajUI4RQ/k4msq9dqRbtiiGZcEiGZS54=@vger.kernel.org, AJvYcCWc155/d4e7LgNS8Jn0ZDnFZ9G15D4Daqej6yDHSm/laC+ooqcj+Yw+LkB96w1cWelOHyvvWlP9i0LIqTs=@vger.kernel.org, AJvYcCXDGbQq7StCkk/6K0Se5ucAJgQDnVi/VQc40bUXLs6VSauV3pQCZhYgcTR5eRK2usXulZfvTvGrMFwp8gwn@vger.kernel.org
X-Received: by 2002:a17:906:6a0c:b0:ab7:9b86:598d with SMTP id
 a640c23a62f3a-abb70ab8c38mr920606566b.17.1739796613341; Mon, 17 Feb 2025
 04:50:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250217105354.551788-1-thierry.bultel.yh@bp.renesas.com> <20250217105354.551788-9-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250217105354.551788-9-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Feb 2025 13:49:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXCndm5Xe2EM-WGedRiOK54LmDCWsyE6fykSoENb_TxrQ@mail.gmail.com>
X-Gm-Features: AWEUYZmi_0iSpSRD5xCgBhjQIHAimNSsAPVES5pUL1N8q8FwLzDP90MNwOmXMQc
Message-ID: <CAMuHMdXCndm5Xe2EM-WGedRiOK54LmDCWsyE6fykSoENb_TxrQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/13] serial: sh-sci: Introduced function pointers
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thierry,

On Mon, 17 Feb 2025 at 11:56, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> The aim here is to prepare support for new sci controllers like
> the T2H/RSCI whose registers are too much different for being
> handled in common code.
>
> This named serial controller also has 32 bits register,
> so some return types had to be changed.
>
> The needed generic functions are no longer static, with prototypes
> defined in sh-sci-common.h so that they can be used from specific
> implementation in a separate file, to keep this driver as little
> changed as possible.
>
> For doing so, a set of 'ops' is added to struct sci_port.
>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>

Thanks for your patch!

Please rebase this on top of commit 22a6984c5b5df8ea ("serial: sh-sci:
Update the suspend/resume support") in tty-next (next-20250217 and
later).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


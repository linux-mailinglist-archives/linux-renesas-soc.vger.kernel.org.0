Return-Path: <linux-renesas-soc+bounces-21711-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 046F5B516E6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 14:29:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E34821C845EB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 12:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AACA72D3ED9;
	Wed, 10 Sep 2025 12:29:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2C6319859;
	Wed, 10 Sep 2025 12:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757507342; cv=none; b=tr+U6Se/qZyLtblAa2QifvlcvMqF75VqpMYT0hY/COXrwQRidJf9+9RWwKEQVNilBs203NxmXRuIssy+0BtotXL/h7Ca1nqIgQZQ2/h3ywqsLhMs9+T3zJPr5HgHs78Ajn0JRgHh4PjqaNG3OlLBaruxvXwTyX2a173z9XkDizs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757507342; c=relaxed/simple;
	bh=GXJL8tEMrEUrj/rgyPsVKWcmrwFPzYdiR1iyH+07+UY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nnAHEGLyikcb0SZO842FgIQBVdLw7yJhaQrT28/HP7YCZs9bRcgaqXDYdLSpPWZXLaQonD4wOlxQnGvFNgmoiHIPwmBQCA4F8Kos4uSKml0zLmY2q9a39IDEzXnL7UIXMcD4/ASH8UbOvWfPlWdgFwBIhuS1UbeNruYRZp1A26Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5357f3e2520so5446847137.1;
        Wed, 10 Sep 2025 05:29:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757507339; x=1758112139;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bZ2tuEbI/wfo9zSS7OXcWKz57EaE7FXhFDKAdrCYbSE=;
        b=XiLbIB21k++qQSAfC9O1mcAWjc6zPdEwx11eoAeQNNO+du5j45Rqy5cbXE5CcwfeeD
         olzhyYi/t4mHy55oIDNV9o8xoHPVNFp0sIcw3/IkzmAGE96cTAoze4fCrT9/BOXZsmJN
         /E+7I+0h57AG0C74hKHSVOrQMiCsTGMcrYU4nlV+Sdd3cXo+n8I4v8LQJldS6u1JShYp
         k5lov5UjWB3zQ+d+wb/RXI/aixqQ1riNYH5rWWmZhH5Axi//0Nl4V+HTLZ0NYsfz36dJ
         2i53B1cgSZmYuXPncpvfXj+5VrjH+ACxMTJI/S5GmrXWCVRmSJ6EeT9U/DO23uuROUrz
         FENA==
X-Forwarded-Encrypted: i=1; AJvYcCWBdI6/UVqSRMHbhw3TqCAMUSxwHRVY+ThugNI6LZrCrfF8jU531jgOsREt4SMUkt1YwOjgpFNLMmYT@vger.kernel.org, AJvYcCX0tKMfPC/pcjtpAuH4cdE1QIyfIyZsjg79G9J8RsfafRD/MUxdUz80nKldpUKjifxrvMxicL/aDP5EfJEQdskciV8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuFiNFaFRy5ThrxFUzoEgUXiPSLxy8wH2dlVfR1ELEm3CVW1n7
	qj1+QIdcC8nbuutY47If96iFY2UkvB+sFsCb6sw/Jx7WuRgJaHQtbKNL8Y49l8/8
X-Gm-Gg: ASbGncvhSe0LvvT0TjzCvkAnDCli+/DEiEvoPC3olHrL/TqaQjyX9Uz5wjPPIOl88v0
	ZKcWKaUcHIQp9a6nkKWCUQY4VDdJo2W3imTrdI5Ch+RCKs86tk/LyLo7QTq4WrqIqoz3dojWSd7
	wFR4nEM0ZJ1/Tixb/xJp4KDn4a4oIc99ehJ3XJPBGutYOoh4Ddr2GbDaG5AKCFDiS4/hHryBxg9
	zogAYDbky/fHqwL48RIstzgn369DDpKmbsEhm/cvBNalqNkqVvFgVEwM0LQB+ezqK8cvczx4qvL
	KFfA4sSp+KLHoNdrQYfUrYK+33rg260t4zL4JFwmLicFPRVXGxc872/WsQ6KBwDiXCUoArRkE+k
	R+ZA0oCIMVhcmtSnuIzQL6BCMcej5JDuN5camJwdRziGVDUupad0AbZ842obKc9ozAvW5OkM=
X-Google-Smtp-Source: AGHT+IFW+4x3JnOnISX1DgXfiPDc6nFjTQ9rB/1ZwNO2B4Z0RNakvPDPuEcpsltsmqpjTG4nZvTQjg==
X-Received: by 2002:a05:6102:f83:b0:524:b9b7:af01 with SMTP id ada2fe7eead31-53d1c3d6e5cmr5151047137.10.1757507339364;
        Wed, 10 Sep 2025 05:28:59 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-52af191584fsm12564954137.11.2025.09.10.05.28.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 05:28:59 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5357f3e2520so5446830137.1;
        Wed, 10 Sep 2025 05:28:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW3b8M/PByu0cSBLXS/cUg9852+W1ZL8IpZCDz3ucTFOlpTyzQ3Ul2Fm8pjAkdbXi4ZS9fGb6pKEAw4@vger.kernel.org, AJvYcCWwzTVmhfB0luJX+8LmWfznZniiq46UfQfXdRZaE+x4/U5/wIwRTPfyPrZjkppblRPwtREf6UzRp8f9+9iYwaL94nM=@vger.kernel.org
X-Received: by 2002:a05:6102:54ac:b0:524:2917:61ae with SMTP id
 ada2fe7eead31-53d2434a99dmr5529506137.35.1757507338562; Wed, 10 Sep 2025
 05:28:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87o6rjvzf4.wl-kuninori.morimoto.gx@renesas.com> <87ldmnvzei.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ldmnvzei.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 Sep 2025 14:28:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXg07+75z6Xt1VHWKNdJRn+f2jfXa5pgoV=qVZqOD5wBQ@mail.gmail.com>
X-Gm-Features: AS18NWAXKaP_7lW3WL0bvnfEmZ2mjZ93KhHC7qVwC490yxKykjuUHhHcjcNHi4I
Message-ID: <CAMuHMdXg07+75z6Xt1VHWKNdJRn+f2jfXa5pgoV=qVZqOD5wBQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] soc: renesas: Identify R-Car X5H
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 10 Sept 2025 at 04:01, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Duy Nguyen <duy.nguyen.rh@renesas.com>
>
> Add support for identifying the R-Car X5H SoC.
>
> [Kuninori: tidyup for upstreaming]
>
> Signed-off-by: Duy Nguyen <duy.nguyen.rh@renesas.com>
> Signed-off-by: Huy Bui <huy.bui.wm@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, will queue in renesas-devel for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


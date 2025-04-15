Return-Path: <linux-renesas-soc+bounces-15995-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A735A89DE3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 14:24:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B86A3161271
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 12:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41F8B29A3F2;
	Tue, 15 Apr 2025 12:20:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEC82036FE;
	Tue, 15 Apr 2025 12:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744719628; cv=none; b=PIOCwtI8UMlRdQVkcdD1xYdNj9NFfOB5cteik+2RIBk5AOF+qfE7ShBTFNMraRHDH/+6UG7hgz91+4kogn/Vf3WzTnskdRV0EmskSxbmefCvX75a2dmrzPeAxouaBgm47UcS4E4A4W82A3Lk5XLK88ai0CI/ntJcGMuFGop1IwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744719628; c=relaxed/simple;
	bh=LPHeTTp9A63WCZtMuf+AbObGxwNJcKR7y3LrWcGuKik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qw64He2f6lg5yjrBYPbLxAtKm6Lflf1LMOb7TPxHsxb8BlWZhUXY3MD3aAKCchjKi8FfSvniGw+RW9ycx6PhwgaDbqm5xR/UKIpSfCJ2kxTum2+WHY5X1CwQ4XbdtQHhpbs7EEDoTRYo9ZSsiRhpfGQdzaipYAma0aWUc/M1Sok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4c4d8638e07so134333137.3;
        Tue, 15 Apr 2025 05:20:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744719625; x=1745324425;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QC/bVSTrTLDwyrH3Kp+UMVUSLaX/RiyydBGd8b6z7K0=;
        b=xUAL31J3IrQ0lCHkWCS4W1mCawemyofz4J3HDcgbY6T/aeMqI6JlLKVl8ZQtZ52bP5
         IsD1p0sC0UYxaj/yV308V/5ICZ9vzGA+QOwo6EstQiolq0kj0E5mWv2u4aHUjQ8+IQJK
         xXfE4SQfpNACcTfTUHK0CR21i9KbVVL7OcpZgh+WaYNRBhYKgDUPLV0pTQxTFdGEDFbt
         noqrFUToiDAAEg6x8lFqn0zoi3AuXIfRZUU9nMp5ux6jTgW6s3V2RIGsBHNlg9ptrUV5
         JttZy0okcBem/xhAoFsBA72hiFicSrmr8lrM+Dyl43sAhOAf5Z6fvbcI+vwUE7XeUcTV
         F0TQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4B5jmGtOseHI88a9Y1HxhXrjXQA3/1t4VWH1kc9WpFi5ONJXIyc5tZSGGrHqK0wHFVl0q3Yh/CrG2vkzh5SZykxw=@vger.kernel.org, AJvYcCU93fFw0PvzyvpPZJGgCNXnvPvQChHtONJZdqzgTt+aqvDLhqnwOPkGGF/OaipQFV86ZUECiaB0DazB@vger.kernel.org, AJvYcCXu6Is2RRoU3eeLnmjLocf3bIBjAgaEFz2RDRCzD5Hj3DwkaL/Msnxh0EH9tdK07ufE3V4IMPlS+7rEUiYn@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+OREnVW9B/vXiE1G9jSEYv9QaDQMhNUyWZv3DdvPyn6dhZ6CV
	SZOkV/JKvR4QEG31G+PLwrfBMSxt40UJqdkd/jFz75Z1vZ87GYEQkNd36a0J
X-Gm-Gg: ASbGncuor1/cU7HW7092er2WBEXnqE5cVllVLfwXbhG7wwle+cOHYdYo2OjvqXmV9gp
	Bv99Uv5BdyOC1cnkFRVZVDntUNeR3o0IGk6o55Vq8ZyA++bAZzURuIVo+kxN5b4JyNs+blzsarx
	jWc23jxenyJhx6nZNN6MJ0xqUNdDrA7yzgOde4eu7zQLYvHeUesjEFjlS7vlmElPVIf5kyF5o3I
	61GavB1QF0XXsQDQhA56wHTctXLz+ft5LQ+co2EbUc1d9L7RLOuXz1Ac37Rqc7iejvHTB88M27n
	Ync11WJlUeEXzDLJbs5VDKUbJk1MKo1Z903kw6KMspMIw/Gq+lN6LzA7fZ3kdLqy/YmQL9mo8yi
	s6Jg=
X-Google-Smtp-Source: AGHT+IGQrk84wSBco0kjZKc8NqugR4b1UrC0xtv15LJZZWvQnmlErM6oHNrJfKe/e+5TYuXkJiWpJw==
X-Received: by 2002:a05:6102:3308:b0:4ba:95f1:cc83 with SMTP id ada2fe7eead31-4c9e4fffa56mr10377528137.16.1744719624717;
        Tue, 15 Apr 2025 05:20:24 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-875572b30a1sm2621568241.31.2025.04.15.05.20.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 05:20:24 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4c300c82ca8so202442137.2;
        Tue, 15 Apr 2025 05:20:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU8MIhlsOmwpF/v9mGhdc5Rczsebc2b60u/1Vpvp6UsQvWIavBV/6cbCrYZu8yITnrO5H/v4sFHOxNg@vger.kernel.org, AJvYcCW37p3epRHvCxgtJOPDbwxLLCCjhhi4imz6qW3zCYx7zClpUzGZpQeprBzjLwpJnwcZ/Kg9nctSRatbKYlB@vger.kernel.org, AJvYcCWsOrXz9UQAyt6nE1R6SwlnufKwatPMRPHP2pw4iwv4jiZEVbt/vxu3KnGKowWnBMPjsVKnN2xqv3TiIcynx1KIl3A=@vger.kernel.org
X-Received: by 2002:a05:6102:4407:b0:4c8:55b8:6fad with SMTP id
 ada2fe7eead31-4c9e5003037mr10374057137.17.1744719623874; Tue, 15 Apr 2025
 05:20:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250329121258.172099-1-john.madieu.xa@bp.renesas.com> <20250329121258.172099-3-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20250329121258.172099-3-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 15 Apr 2025 14:20:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWTU_=WS4Z2eczA8BSZjio6cAMKrzrOHZ-O9sfxX6+byQ@mail.gmail.com>
X-Gm-Features: ATxdqUGWVaybAEbIQyupuLn0ffcz3brcbnux64U0tWfBCvQZqrPYP3p0tpJR0YU
Message-ID: <CAMuHMdWTU_=WS4Z2eczA8BSZjio6cAMKrzrOHZ-O9sfxX6+byQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: rzg3e-smarc-som: add raa215300
 pmic support
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, magnus.damm@gmail.com, 
	robh@kernel.org, biju.das.jz@bp.renesas.com, devicetree@vger.kernel.org, 
	john.madieu@gmail.com, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 29 Mar 2025 at 13:13, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Enable raa215300 pmic and built-in rtc support on RZ/G3E SoM module
> Also add related clock and interrupt signals.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


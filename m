Return-Path: <linux-renesas-soc+bounces-887-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC7C80CA55
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Dec 2023 14:00:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 493BC281B4F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Dec 2023 13:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB9003D386;
	Mon, 11 Dec 2023 13:00:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 121F0B8;
	Mon, 11 Dec 2023 04:59:57 -0800 (PST)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dbc1efc23f7so3431329276.2;
        Mon, 11 Dec 2023 04:59:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702299596; x=1702904396;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0C2ieL1JqrNcU7KA76mZIHd+67WjieYCcgN34Ch4tRg=;
        b=FH4rOogtiFI21jaPdLT7B+4y71ezdjgwwk6omSwfJWJYHUUqjpI00R8ga8rlTTJiCt
         4j+qHmPK/W1NOAaTlWci0Kw+3VeEJMe1BF4xMxTtq4Deqr9LLE7cp9ud/eeFGOW5xBFe
         Z6BHYooU+Bf4PPfYUokFcmORzKmOeEH/CuGfsWJowQg5UNpGnxnQgSmrnXkIhiahPi4C
         YuWkrLDEN5BGXcSrwHsRiJUUwRP1V47f39Iqaf3UGojjrnabsMXSR/hu9Vh6GOC9Jq9a
         N/cye9PzwsHEv7lwh/qQfQqg7Dul4XcTvgILHQl5njn3TwYXKzuwLJCpBJdFlHZdQvHV
         nvfQ==
X-Gm-Message-State: AOJu0YwkEuJCOerSlXEdRoWu04J79IISLX8H1/k0T/+jWf8BBo/T2wgK
	WJbnVGHTm5S0SQ3ZsPyT0nt4wKAlZY5scA==
X-Google-Smtp-Source: AGHT+IGcGTlztEh1npgsyKNR9Ju4JSAHZ7JnUI0dtAnaXLlJPaoNk6nJhg9yKysPNGVVuSRJD9Fuew==
X-Received: by 2002:a05:6902:150:b0:db9:6ad7:1abb with SMTP id p16-20020a056902015000b00db96ad71abbmr2408972ybh.12.1702299596074;
        Mon, 11 Dec 2023 04:59:56 -0800 (PST)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id a12-20020a25938c000000b00d9ac1f0e23csm2469641ybm.56.2023.12.11.04.59.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 04:59:55 -0800 (PST)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-da077db5145so3458878276.0;
        Mon, 11 Dec 2023 04:59:55 -0800 (PST)
X-Received: by 2002:a25:6b4d:0:b0:db4:25b7:5f8b with SMTP id
 o13-20020a256b4d000000b00db425b75f8bmr2070527ybm.63.1702299595000; Mon, 11
 Dec 2023 04:59:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Dec 2023 13:59:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUqbbjRpkStD7JGQ0r9hfR-sgx23FKGDASofX87AzaEcA@mail.gmail.com>
Message-ID: <CAMuHMdUqbbjRpkStD7JGQ0r9hfR-sgx23FKGDASofX87AzaEcA@mail.gmail.com>
Subject: dt-validate crash on <foo>-gpio
To: Rob Herring <robh+dt@kernel.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

When running "make dtbs_check" on a DTB in the Renesas BSP, I ran into
the following backtrace:

    Traceback (most recent call last):
      File "dt-validate", line 8, in <module>
        sys.exit(main())
      File "dt-schema/dtschema/dtb_validate.py", line 144, in main
        sg.check_dtb(filename)
      File "dt-schema/dtschema/dtb_validate.py", line 87, in check_dtb
        dt = self.validator.decode_dtb(f.read())
      File "dt-schema/dtschema/validator.py", line 491, in decode_dtb
        return [dtschema.dtb.fdt_unflatten(self, dtb)]
      File "dt-schema/dtschema/dtb.py", line 483, in fdt_unflatten
        fixup_gpios(dt)
      File "dt-schema/dtschema/dtb.py", line 373, in fixup_gpios
        fixup_gpios(v)
      File "dt-schema/dtschema/dtb.py", line 373, in fixup_gpios
        fixup_gpios(v)
      File "dt-schema/dtschema/dtb.py", line 373, in fixup_gpios
        fixup_gpios(v)
      File "dt-schema/dtschema/dtb.py", line 378, in fixup_gpios
        val = v[0]
    TypeError: 'bool' object is not subscriptable

Turns out the issue is triggered by the presence of a (non-documented)
boolean "no-use-gpio" property.

Apparently anything that matches "*-gpio" is treated as having a list of
GPIO specifiers, causing a crash if that does not turn out to be true...
While the introduction of a "no-use-gpio" boolean property might not
survive public review, it would be good if the tooling wouldn't crash
on it.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


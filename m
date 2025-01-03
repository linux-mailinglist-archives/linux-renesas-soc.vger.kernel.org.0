Return-Path: <linux-renesas-soc+bounces-11803-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B3206A008E0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 12:48:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A8287A1BAA
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 11:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69A8C1F9AB5;
	Fri,  3 Jan 2025 11:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="TY366JCD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DD31B87FA
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Jan 2025 11:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735904911; cv=none; b=d7S5KWsPM3+2SMCu2Fqk+jJbH1pcmorPpqkbc9GhJEvv7vd+vb6rudifQ/BYfRb4/0oY4ln2Dh00EHRshIADY3+pQegxHXMrOC6wHP/7APbkCeUx6mAJ8ubAc4O96MAlUmI1L8Eq/b28bxzfawn8JIboxcfa/NMGGzLJ1bW5Xl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735904911; c=relaxed/simple;
	bh=XZ2DtQEz/3z1jB871Q4S61hRlmYUNyDZ52JWmG4S2y4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=LHehFoDuVoIsk2/WzrPfl7OEeg3Igi8oRJn3EZlBO66XBvnq1qqUE2T9P0qEEas3omkxwrTMZ2XrAImE9X6B4In2uF2HF3y6pEMacrvGUH1/xamETayyRhH4y6LZ2xCmL7JuRuQ6UrCVB7xdXpHGpG31EdrzDSmasuWRzptl33E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=TY366JCD; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5d7e3f1fc01so24531845a12.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Jan 2025 03:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1735904906; x=1736509706; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B8DQ4jy03Fwq8ZpcJrPKXmKWq73LTDGPNDxW+/ZvxNA=;
        b=TY366JCDxtC/oPrMb/Yq1fMWgKwkpmFVZCMeVrQbpR8jyuy5JwLW0D1K6ldrDxAcPU
         0WthKTR7ejSh10pEgA1MO1ArRwe15nIloR9PFqbNPMszksGIghmClppmmA3EhpthVBge
         LegeMaOyXMaEp8qy7nc8Ot6PR0/ermHPplaxIu7sSgQBJ9D8q1JDBT0NbAbDd2mAIRE1
         nnGXWITYZsth9h/BKGlFcpaToJ4DjCgGqqv6ixOZyR+1rxHfOOkUO+4A68dv0RYtUY/4
         6U13oHnVh0Njm02lRC6AYNMGRX0I7XRroVncyxwXNIBZ9YehnP128wSpQ+HwkP4Upiu2
         Yyfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735904906; x=1736509706;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B8DQ4jy03Fwq8ZpcJrPKXmKWq73LTDGPNDxW+/ZvxNA=;
        b=cW0PHNN7uNEcwgEGjiNIaTP9NL4vAxW4BfiNwXuhNsZjSbJU4kCYmIkzNvrJWdZT8d
         YumD2ufrr5vMkD+KWRR4Zbe/3b118b5TR0MQduPzY6bvbzhSYviXlZ7Es28ZAuNOgJqn
         KyZYKjV70F5gITHY9NpGFUbqshnzTuNd4V2gP8Zggwd7489VCvMOdC8MzMd5hEOHT+X9
         Zc/jXZOulRbaOAs7aF6dBqALm9d95jnHCx0k5HDjF3ZEcQKmtp8IUzQKz1/U0bj024mK
         MmRhgcJgiZiamMCyLW9rlVj5fw4ee6vIhiaSwO/2Uh+4u5sMGQWplalAPvX2uNWsi61R
         1QIA==
X-Forwarded-Encrypted: i=1; AJvYcCUP9CAilhj+9BFVRAObOCUg/GS4h+foTWjyG60vxJXzjkAL01F+psYtpV1oGlmiff95kxadifAImo+0up1yqu/bzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwX32XXdZHBmbnJ7/O+aeg0AIWQgDr0fY+pH/wQ1f5umRRs9vIa
	LTvCaurAx0OoJMITSQXnzg0sNaJsnOHst7QL3E8JvatjWdQ4l0psgjWkl18VI1E=
X-Gm-Gg: ASbGncuPGPvB8aCDgWWbfZejWNwd0/Q5Rb3BSGrRHlI153kOGTI1yTL6U1gyfIFFW1o
	sFz0uBnyTJcICOZ9aA5BtmD1q+pWM2QHOYssBLoPRtvL+22OwXPqaklufyCorrkvV7WRd83cigG
	7T1s6jvXnQhqaxeg/dtiZyvzJSJ4dPze0tVfJGPJlx7ARSozZLdysSZdzyDwNxrpDLk39JeRrYy
	I6qo3wxalda653OuWlB0em+AwBtb3HhdtDIJBqUVMiOwGj0HdxbAfNksVelbq88qA==
X-Google-Smtp-Source: AGHT+IHGKaHVfxbOwUr7E76BNC6Zh2mbj9h23QVs1Lemm1ZXgmsp58gbWI8To35eheJYw2y1rjWVtQ==
X-Received: by 2002:a17:907:94d4:b0:aa6:5eae:7ed6 with SMTP id a640c23a62f3a-aac2a9ac6d2mr4238245666b.13.1735904905479;
        Fri, 03 Jan 2025 03:48:25 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe3c25sm1923710666b.100.2025.01.03.03.48.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 03:48:25 -0800 (PST)
Message-ID: <8d0ac514-5709-43c5-bc27-e40ad020b9e7@tuxon.dev>
Date: Fri, 3 Jan 2025 13:48:23 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 0/6] serial: sh-sci: Fixes for earlycon and
 keep_bootcon
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 gregkh@linuxfoundation.org, jirislaby@kernel.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, lethal@linux-sh.org,
 g.liakhovetski@gmx.de, groeck@chromium.org, mka@chromium.org,
 ulrich.hecht+renesas@gmail.com, ysato@users.sourceforge.jp,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20241204155806.3781200-1-claudiu.beznea.uj@bp.renesas.com>
 <Z1DLyQdzUzJzRUJJ@shikoro> <b6c7b4d3-021c-4a4b-9e91-316603b348c1@tuxon.dev>
 <CAMuHMdWx97OnPWnQn78oL+vVuQXmeaJP-byc_4ZwBMZhMOorxw@mail.gmail.com>
 <c2b64230-f038-4da7-bc07-235072535ae1@tuxon.dev>
Content-Language: en-US
In-Reply-To: <c2b64230-f038-4da7-bc07-235072535ae1@tuxon.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Geert,

On 21.12.2024 11:54, Claudiu Beznea wrote:
> Hi, Geert,
> 
> On 19.12.2024 17:11, Geert Uytterhoeven wrote:
>> Hi Claudiu,
>>
>> On Thu, Dec 5, 2024 at 9:39 AM Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
>>> On 04.12.2024 23:38, Wolfram Sang wrote:
>>>>> in the following scenarios:
>>>>>
>>>>> 1/ "earlycon keep_bootcon" were present in bootargs
>>>>> 2/ only "earlycon" was present in bootargs
>>>>> 3/ none of the "earlycon" or "earlycon keep_bootcon" were present in
>>>>>    bootargs
>>>> ...
>>>>> Please give it a try on your devices as well.
>>>>
>>>> Will happily do so. Is there something to look for? Except for "it
>>>> works"?
>>>
>>> As this code touches the earlycon functionality, of interest are the 3
>>> cases highlighted above:
>>>
>>> 1/ "earlycon keep_bootcon" are both present in bootargs
>>> 2/ only "earlycon" is present in bootargs
>>> 3/ none of the "earlycon" or "earlycon keep_bootcon" are present in
>>>    bootargs
>>>
>>> One other thing, that I was currently able to test only on RZ/G3S, is to
>>> see how it behaves when the debug serial is described in DT with an alias
>>> other than zero. E.g., on [1] the debug serial alias on RZ/G3S was changed
>>> from 0 to 3. With the new alias (3) there were issues that I've tried to
>>> fix with this series.
>>
>> I gave this a try on Koelsch, which has two easily-accessible usb-serial
>> ports, for all three cases above.  Originally, I had CONFIG_VT_CONSOLE=y
>> (tty0 takes over from earlycon rather early), but I had to disable
>> that to exercise all code paths (ttySC0 takes over much later).
>>
>>   A. CONFIG_VT_CONSOLE=y: OK
>>   B. CONFIG_VT_CONSOLE=y earlycon: OK
>>        early_console_setup: mapbase 0x00000000e6e60000
>>        earlycon: scif0 at MMIO 0x00000000e6e60000 (options '115200n8')
>>        printk: legacy bootconsole [scif0] enabled
>>        printk: legacy console [tty0] enabled
>>        printk: legacy bootconsole [scif0] disabled
>>        early_console_exit: Clearing sci_ports[0]
>>   C. CONFIG_VT_CONSOLE=n earlycon: OK
>>        early_console_setup: mapbase 0x00000000e6e60000
>>        earlycon: scif0 at MMIO 0x00000000e6e60000 (options '115200n8')
>>        printk: legacy bootconsole [scif0] enabled
>>        printk: legacy console [ttySC0] enabled
>>        printk: legacy bootconsole [scif0] disabled
>>        early_console_exit: Not clearing sci_ports[0]
>>   D. CONFIG_VT_CONSOLE=y earlycon keep_bootcon: OK
>>        early_console_setup: mapbase 0x00000000e6e60000
>>        earlycon: scif0 at MMIO 0x00000000e6e60000 (options '115200n8')
>>        printk: legacy bootconsole [scif0] enabled
>>        printk: legacy console [tty0] enabled
>>
>> So all good, but note that these cases worked fine without your
>> series, too.
>>
>> The real troublesome cases involve using earlycon on a different
>> serial port than serial0.  As I don't have any Renesas boards where
>> chosen/stdout-path does not use serial0, I tried exchanging the serial0
>> and serial1 DT aliases, and updating chosen/stdout-path accordingly.
>>
>>   E. CONFIG_VT_CONSOLE=y: OK
>>   F. CONFIG_VT_CONSOLE=y earlycon: OK
>>        early_console_setup: mapbase 0x00000000e6e60000
>>        earlycon: scif0 at MMIO 0x00000000e6e60000 (options '115200n8')
>>        printk: legacy bootconsole [scif0] enabled
>>        printk: legacy console [tty0] enabled
>>        printk: legacy bootconsole [scif0] disabled
>>        early_console_exit: Clearing sci_ports[0]
>>   G. CONFIG_VT_CONSOLE=y earlycon keep_bootcon: SCIF1 missing
>>        early_console_setup: mapbase 0x00000000e6e60000
>>        earlycon: scif0 at MMIO 0x00000000e6e60000 (options '115200n8')
>>        printk: legacy bootconsole [scif0] enabled
>>        printk: legacy console [tty0] enabled
>>        sh-sci e6e68000.serial: error -EBUSY: sci_port[0] is used by earlycon!
>>   H. CONFIG_VT_CONSOLE=n earlycon: SCIF1 missing
>>        early_console_setup: mapbase 0x00000000e6e60000
>>        earlycon: scif0 at MMIO 0x00000000e6e60000 (options '115200n8')
>>        printk: legacy bootconsole [scif0] enabled
>>        printk: legacy console [ttySC1] enabled
>>        printk: legacy bootconsole [scif0] disabled
>>        early_console_exit: Not clearing sci_ports[0]
>>        sh-sci e6e68000.serial: error -EBUSY: sci_port[0] is used by earlycon!
>>
>> Case G gives a missing SCIF1, because sci_port[0] is still
>> used for earlycon, as expected.
>> Case H also gives a missing SCIF1, but should succeed IMHO, as earlycon
>> is no longer active.  I think early_console_exit() should clear the
>> earlycon flag regardless.
> 
> I'll double check it.

Indeed, clearing the earlycon flag leads to case H succeeding as well.

> 
>>
>> Note that before your series, cases E-F worked too, but cases G-H gave
>> an initialized but broken SCIF1 instead.
>>
>> Now, can we improve?
>>   - Can we use a proper id instead of zero for earlycon, e.g.
>>     sci_probe_earlyprintk() does fill in early_serial_console.index?
> 
> I looked into that but, as of my investigation, index zero is the one used
> in the earlyprintk initialization process. sci_probe_earlyprintk() is
> called from sci_probe(). I'll double checked it though, anyway.


As of my investigation, the current code initializes the index based on the
name registered though the OF_EARLYCON_DECLARE(). That name is used in
earlycon_init() to initialize the early serial index:

of_setup_earlycon(match, ...)
   earlycon_init(&earlycon_console_dev, match->name)
      // ...
      earlycon->index = simple_strtoul(s, NULL, 10);
      // ...

On sh-sci driver that name is generic and have nothing to do with board setup.

Also, in the sh-sci early_console_setup() function we cannot use
of_alias_get_id() as we don't have a struct device node associated to the
struct earlycon_device object, argument of early_console_setup(), when the
earlycon is configured. And I think, at the moment the
early_console_setup() is called the alias list is not yet populated.

Parsing the linux,stdout-path/stdout-path again in early_console_setup()
will duplicate the code from early_init_dt_scan_chosen_stdout().

I have a PoC code that parses the alias from the stdout-chosen, in
early_init_dt_scan_chosen_stdout(), but introducing it may need testing on
all the currently enabled devices, to avoid breakage. This code takes into
account the device alias provided though the device tree (rudimentary
tested for the moment). Diff bellow:

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 0121100372b4..ce65b9cc620d 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -876,10 +876,11 @@ void __init
early_init_dt_check_for_usable_mem_range(void)
 int __init early_init_dt_scan_chosen_stdout(void)
 {
        int offset;
-       const char *p, *q, *options = NULL;
-       int l;
+       const char *p, *q, *tmp, *options = NULL;
+       int l, alias_len;
        const struct earlycon_id *match;
        const void *fdt = initial_boot_params;
+       int alias;
        int ret;

        offset = fdt_path_offset(fdt, "/chosen");
@@ -898,6 +899,7 @@ int __init early_init_dt_scan_chosen_stdout(void)
        if (*q != '\0')
                options = q + 1;
        l = q - p;
+       alias_len = q - p;

        /* Get the node specified by stdout-path */
        offset = fdt_path_offset_namelen(fdt, p, l);
@@ -906,6 +908,16 @@ int __init early_init_dt_scan_chosen_stdout(void)
                return 0;
        }

+       /* Get the alias ID. */
+       /* scan backwards from end of string for first non-numeral */
+       for (tmp = p + alias_len;
+            tmp > p && tmp[-1] >= '0' && tmp[-1] <= '9';
+            tmp--)
+               ;
+
+       if (*tmp)
+               alias = *tmp - '0';
+
        for (match = __earlycon_table; match < __earlycon_table_end; match++) {
                if (!match->compatible[0])
                        continue;
@@ -913,7 +925,7 @@ int __init early_init_dt_scan_chosen_stdout(void)
                if (fdt_node_check_compatible(fdt, offset, match->compatible))
                        continue;

-               ret = of_setup_earlycon(match, offset, options);
+               ret = of_setup_earlycon(match, offset, options, alias);
                if (!ret || ret == -EALREADY)
                        return 0;
        }
diff --git a/drivers/tty/serial/earlycon.c b/drivers/tty/serial/earlycon.c
index ab9af37f6cda..52b4a5c56269 100644
--- a/drivers/tty/serial/earlycon.c
+++ b/drivers/tty/serial/earlycon.c
@@ -53,7 +53,7 @@ static void __iomem * __init earlycon_map(resource_size_t
paddr, size_t size)
 }

 static void __init earlycon_init(struct earlycon_device *device,
-                                const char *name)
+                                const char *name, int alias)
 {
        struct console *earlycon = device->con;
        const char *s;
@@ -66,6 +66,9 @@ static void __init earlycon_init(struct earlycon_device
*device,
                ;
        if (*s)
                earlycon->index = simple_strtoul(s, NULL, 10);
+       else if (alias >= 0)
+               earlycon->index = alias;
+
        len = s - name;
        strscpy(earlycon->name, name, min(len + 1, sizeof(earlycon->name)));
        earlycon->data = &early_console_dev;
@@ -150,7 +153,7 @@ static int __init register_earlycon(char *buf, const
struct earlycon_id *match)
        if (port->mapbase)
                port->membase = earlycon_map(port->mapbase, 64);

-       earlycon_init(&early_console_dev, match->name);
+       earlycon_init(&early_console_dev, match->name, -1);
        err = match->setup(&early_console_dev, buf);
        earlycon_print_info(&early_console_dev);
        if (err < 0)
@@ -275,7 +278,8 @@ early_param("console", param_setup_earlycon_console_alias);

 int __init of_setup_earlycon(const struct earlycon_id *match,
                             unsigned long node,
-                            const char *options)
+                            const char *options,
+                            int alias)
 {
        int err;
        struct uart_port *port = &early_console_dev.port;
@@ -337,7 +341,7 @@ int __init of_setup_earlycon(const struct earlycon_id
*match,
                strscpy(early_console_dev.options, options,
                        sizeof(early_console_dev.options));
        }
-       earlycon_init(&early_console_dev, match->name);
+       earlycon_init(&early_console_dev, match->name, alias);
        err = match->setup(&early_console_dev, options);
        earlycon_print_info(&early_console_dev);
        if (err < 0)
diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 17e0cd7642fc..10dff3053218 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -3655,17 +3655,19 @@ static int early_console_exit(struct console *co)
 static int __init early_console_setup(struct earlycon_device *device,
                                      int type)
 {
+       int index = device->con->index;
+
        if (!device->port.membase)
                return -ENODEV;

        device->port.type = type;
-       sci_ports[0].port = device->port;
+       sci_ports[index].port = device->port;
        port_cfg.type = type;
-       sci_ports[0].cfg = &port_cfg;
-       sci_ports[0].params = sci_probe_regmap(&port_cfg);
-       sci_ports[0].earlycon = true;
-       port_cfg.scscr = sci_serial_in(&sci_ports[0].port, SCSCR);
-       sci_serial_out(&sci_ports[0].port, SCSCR,
+       sci_ports[index].cfg = &port_cfg;
+       sci_ports[index].params = sci_probe_regmap(&port_cfg);
+       sci_uart_earlycon = true;
+       port_cfg.scscr = sci_serial_in(&sci_ports[index].port, SCSCR);
+       sci_serial_out(&sci_ports[index].port, SCSCR,
                       SCSCR_RE | SCSCR_TE | port_cfg.scscr);

        device->con->write = serial_console_write;
diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
index 743b4afaad4c..06c46ade5482 100644
--- a/include/linux/serial_core.h
+++ b/include/linux/serial_core.h
@@ -1078,7 +1078,7 @@ extern const struct earlycon_id __earlycon_table_end[];
 #define EARLYCON_DECLARE(_name, fn)    OF_EARLYCON_DECLARE(_name, "", fn)

 int of_setup_earlycon(const struct earlycon_id *match, unsigned long node,
-                     const char *options);
+                     const char *options, int alias);

 #ifdef CONFIG_SERIAL_EARLYCON
 extern bool earlycon_acpi_spcr_enable __initdata;


What do you think? Are you OK with still handling it in the driver though
the index 0 (mostly as it has been proposed in the previous version) or
prefer to go with the PoC code that may change behavior on current devices?
Or do you have another idea?

Thank you,
Claudiu

> 
> 
>>   - Alternatively, can we use a separate sci_port structure instead
>>     of abusing sci_ports[0]?
> 
> I explored this too, but didn't manage to make it work.
> 
> Thank you for running all these tests,
> Claudiu
> 
>>
>> Thanks!
>>
>> Gr{oetje,eeting}s,
>>
>>                         Geert
>>
>>
>> --
>> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>>
>> In personal conversations with technical people, I call myself a hacker. But
>> when I'm talking to journalists I just say "programmer" or something like that.
>>                                 -- Linus Torvalds
> 



Return-Path: <linux-renesas-soc+bounces-25499-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B23C9C5F8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Dec 2025 18:21:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F22F24E07AD
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Dec 2025 17:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B02582C0261;
	Tue,  2 Dec 2025 17:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ly1r69ba"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23842BE65F
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Dec 2025 17:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764696061; cv=none; b=CSoXelT3VpvxyzZI4KkYgWluNRZVcAvE+/PWXOHUcI+qXIAwfs+Yz1CxfNU+7Ws16+wXw6R7Mo5aY9AzFZr1YMjFQeY3lap3uIDQIpQwes/BJnK7nErqevPxy6R/uMZV4hIeyupkU6P7C40LGe5wxYTynney/N+LEeW9/g0K7Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764696061; c=relaxed/simple;
	bh=D6cujDhDtOcbt7TUxe8KHjkX83CszqubAOZwa97WWXM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mrbE5ahfr7k+TdT5ACwjslgTc6Cg20khThn0NlXRyh/RWgLWjQnvvAB8bU1EGfcZ5OaDSBinOFqnhI15CJR7R62Cb2KRF5EFViWGsxT20LcnYiOM8SkOLVMEIsmE43LXiifK1RSzSKGKZvkVzPOa3xbacD7OSsayEz36eARq0oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ly1r69ba; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42e2cf93f7dso2157511f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Dec 2025 09:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764696058; x=1765300858; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n1BT7EHXNzu1vkfANQoOALlxYL5lcX+7Z2Q/CxBrAT0=;
        b=ly1r69badI3ROHxjqMV05WTAhosZgkViLC7/YkDx32LNHRhlbfHvEd0d5M85zfBGES
         P4t/+dbOPskuLJJF0GSkjstczqmKFsWJLZlRCE87NALT+yLD+8CRqeUu91yDjpUPZj/+
         WHTaaOz8bjEwHO3tD+BCzxyA+A/h6Jz6qAheabsGViR8EaIqM54kAgK4QtTjQ3+jjn9e
         UcxAY8Stf0bHQu2oUU+45ySq2gofchB+Vag1EIXD1qYnh3vepRFrvpWP2H2CZp4nZaU4
         XaiOX06kKbY4lXzE64T2XDIi2EBhNGjEmLrdBcN6XO7GNSLODsOBk47ykFxdxPP2QFsN
         RK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764696058; x=1765300858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n1BT7EHXNzu1vkfANQoOALlxYL5lcX+7Z2Q/CxBrAT0=;
        b=BUycD5GNdR50C0SI8lWo0T1oAlm1cHEjO0483W3ePas2HQZ8+fUZHZQL0GKKKTKOP+
         RapvkN8TH0XkPwSMsqMefvdt6fZ5q1UzgWX0Y8Nvh/cNrdKZTkbk+GDmWnhDLFU7IM7F
         xYu2yQ+fZNVT7Pn6E4fq1Q1VQnCl9qDIbzwx3mYYIQjzHmwBfhWhQCyzCxVxcGzb90oI
         mR/0SYX5lhZZIHxG07lNYpYXaW722mZXNCWn8Iyassi9oUN/8mzKTj4tp5QROSH4Rc5y
         5Pd471F+sONqYLqAQewy+BvJGERlrz0CT6ZZ9o3in60wRkNmRpbGZijNYD5BpTWxQhp4
         rXaA==
X-Forwarded-Encrypted: i=1; AJvYcCVsLEbqeXv/bhJPPdE4S5QAYQboR/3kWIPkOiPX1liHqIMZ4lLp30AmqD+D0jHgS2Py/TEKFFIai5+GHxzSKag2BA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwOguZHaRAX3VLdGGkHIFJ9IpNoqqJdaLMD0zHTkd8WXrZWHsA
	5JO8VlSzoCkVvu2yafY6yCazD+9QJZHPqH5f+bFmKdk4NjyrJeglVH0GpaHD3o1GFttc7ZQYj/x
	FZLkf6M7IwwF/Udd2z/Ek+65WO1ij90U=
X-Gm-Gg: ASbGncsCRbcgRFFqzhnDX8kTns3rfmR/bbUBFXliF9Q0WY/9i7WjnAymDCp1FtYi9NU
	fVwJih7rsPgF+reL+HK1htNiREBZx95625Dx6E+02UWvruxpl9JoOjXRng5hnq28L6k/HpR26cZ
	UveIvalCdlJ3C2RJBTMnqw+mBmFNgGcDw1NKj/lG/Pb1XOMoCCvgJVELxQoD4iypLFXTsOqiJ7A
	TRlW1mERqL/HFD8OHnSZkCWnWBlIN2I1i2uBwho920Wz01w0oN+hf2N54iLJYs5VawrwcI8jSLy
	D1zo3MNjfUOXz+QRoOJbNRrmKrtUcjf8RA0S+w==
X-Google-Smtp-Source: AGHT+IHHkzquubDncEgzKAjffld+KGygoMEWTgQ02TjxZ1n7kHuWGvQfDuCUieNWJWiu1doe66mEBlRuj1GGu1Sb+Kk=
X-Received: by 2002:a05:6000:230f:b0:42b:4223:e62a with SMTP id
 ffacd0b85a97d-42cc1cbe219mr45227224f8f.23.1764696057923; Tue, 02 Dec 2025
 09:20:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251129164325.209213-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20251129164325.209213-1-biju.das.jz@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 2 Dec 2025 17:20:31 +0000
X-Gm-Features: AWmQ_bmEp3rxLNkyPH2GbHJpGnJbWFjGlZQZl8dFFsPo6e9aZepSroMSoKsGvsY
Message-ID: <CA+V-a8skz6D__T3oeTq4vfikkxRKM=6MAEgsu_MK01RqVLrjkA@mail.gmail.com>
Subject: Re: [PATCH v5 00/17] Add RZ/G3E RSCI support
To: Biju <biju.das.au@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

Thank you for the series.

On Sat, Nov 29, 2025 at 4:43=E2=80=AFPM Biju <biju.das.au@gmail.com> wrote:
>
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add RZ/G3E RSCI support for FIFO and non-FIFO mode. RSCI IP found on
> RZ/G3E SoC is similar to one on RZ/T2H, but has 32-stage fifo. RZ/G3E has
> 6 clocks (5 module clocks + 1 external clock) compared to 3 clocks
> (2 module clocks + 1 external clock) on RZ/T2H, and it has multiple
> resets. It has 6 irqs compared to 4 on RZ/T2H. Add support for the hardwa=
re
> flow control.
>
> v4->v5:
>  * Updated commit description related to IRQ difference in binding patch.
>  * Dropped the tag for binding patch as there are new changes.
>  * Added aed and bfd irqs for RZ/G3E.
>  * Moved reset: false to RZ/T2H SoC and dropped the else part for RZ/G3E.
>  * Updated conditional schema with interrupts and interrupts-names.
>  * Added new patch for set_rtrg() callback.
>  * Dropped checking port type for device file{create, remove} and instead
>    started checking the fifosize.
>  * Dropped sci_is_fifo_type() helper.
>  * Renamed rsci_port_params->rsci_rzt2h_port_params.
>  * Renamed rsci_rzg3e_scif_port_params->rsci_rzg3e_port_params.
> v3->v4:
>  * Collected tags.
>  * Dropped separate compatible for non-FIFO mode and instead using single
>    compatible "renesas,r9a09g047-rsci" as non-FIFO mode can be achieved
>    by software configuration.
>  * Dropped the non-FIFO mode support and will add this support later.
>  * Renamed clock-names from bus->pclk
>  * Rearranged the clock-names tclk{4, 16, 64}
>  * Added separate patch for sci_is_fifo_type() covering all SoCs that has
>    FIFO.
>  * Updated commit header and description for patch#{3,9,16}
>  * Dropped rsci_clear_SCxSR() instead of rsci_clear_CFC() as it clears th=
e
>    CFCLR register.
>  * Added separate patch for updating t2h rx_trigger size from 15->16.
>  * Added separate patch for renaming port SCI_PORT_RSCI->RSCI_PORT_SCIF16=
.
>  * Dropped enum RSCI_PORT_SCI
>  * Replaced the enum RSCI_PORT_SCIF->RSCI_PORT_SCIF32
>  * Moved rx_trigger update to later patch#16.
>  * Reduced the checks in sci_init_clocks() by avoid looking up clocks tha=
t
>    are not relevant for the port.
>  * Added separate patch for updating early_console data and callback()
>    names.
>  * Updated rsci_type() to drop "scif" type instead use "rsci"
>  * Replaced the compatible "renesas,r9a09g047-rscif" with
>    "renesas,r9a09g047-rsci"
>  * Renamed the port enum from RSCI_PORT_SCIF->RSCI_PORT_SCIF32.
>  * Renamed of_rsci_scif_data->of_rsci_rzg3e_data
>  * Renamed the funvtion rsci_rzg3e_scif_early_console_setup() with
>    rsci_rzg3e_early_console_setup().
> v2->v3:
>  * Dropped 1st and 3rd items from clk-names and added minItems for the
>    range for the binding patch.
>  * Added minItems for clk and clk-names for RZ/T2H as the range is 2-3
>  * Added maxItems for clk and clk-names for RZ/G3E as the range is 5-6
>  * Retained the tag as it is trivial change.
>  * Updated dev_err_probe() in sci_init_clocks() as it fits in 100-column
>    limit.
>  * Dropped cpu_relax() from rsci_finish_console_write() and added a
>    comment.
>  * Added sci_is_rsci_fifo_type() helper for reuse in probe() and remove()=
.
> v1->v2:
>  * Updated commit message for patch#1,#3,#9
>  * Added resets:false for non RZ/G3E SoCs in bindings.
>  * Increased line limit for error messages to 100-column limit for patch#=
3
>  * Updated multiline comment to fit into single line.
>  * Updated set_termios() for getting baud_rate()
>
> Biju Das (17):
>   dt-bindings: serial: renesas,rsci: Document RZ/G3E support
>   serial: sh-sci: Update rx_trigger size for RZ/T2H RSCI
>   serial: rsci: Add set_rtrg() callback
>   serial: sh-sci: Drop checking port type for device file{create,
>     remove}
>   serial: rsci: Drop rsci_clear_SCxSR()
>   serial: sh-sci: Drop extra lines
>   serial: rsci: Drop unused macro DCR
>   serial: rsci: Drop unused TDR register
>   serial: sh-sci: Use devm_reset_control_array_get_exclusive()
>   serial: sh-sci: Add sci_is_rsci_type()
>   serial: sh-sci: Rename port SCI_PORT_RSCI->RSCI_PORT_SCIF16
>   serial: sh-sci: Add RSCI_PORT_SCIF32 port ID
>   serial: sh-sci: Add support for RZ/G3E RSCI clks
>   serial: sh-sci: Make sci_scbrr_calc() public
>   serial: sh-sci: Add finish_console_write() callback
>   serial: rsci: Rename early_console data, port_params and callback()
>     names
>   serial: sh-sci: Add support for RZ/G3E RSCI
>
>  .../bindings/serial/renesas,rsci.yaml         |  99 +++++-
>  drivers/tty/serial/rsci.c                     | 310 ++++++++++++++++--
>  drivers/tty/serial/rsci.h                     |   3 +-
>  drivers/tty/serial/sh-sci-common.h            |  10 +-
>  drivers/tty/serial/sh-sci.c                   |  80 +++--
>  5 files changed, 422 insertions(+), 80 deletions(-)
>
Tested on RZ/V2H and RZ/V2N EVKs,

Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar


> --
> 2.43.0
>
>


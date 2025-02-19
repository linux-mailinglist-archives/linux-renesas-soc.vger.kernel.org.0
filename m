Return-Path: <linux-renesas-soc+bounces-13327-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C740A3BF68
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Feb 2025 14:06:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 726597A1F47
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Feb 2025 13:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CF7B1E0DDF;
	Wed, 19 Feb 2025 13:06:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639A7286293;
	Wed, 19 Feb 2025 13:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739970403; cv=none; b=qlcUVsPB2HaFuPca/MNKMGqE0hacST5v1HX8GeJHFQf2olBLuS4raabwGoLeiuiB/o6o5EwuR/9ENI3AwVc4/Qe3FA7LKlZ2G8S8kRVSCWIbsqifhQHSd4vSB40aN5NJJ6lJVtuEKhsmbXQXyZyBCDvhOHd8qCjjAC/nQGTzjHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739970403; c=relaxed/simple;
	bh=03L08WyZP7UR8KTmpkdNOiGNKb6IiA205h/CsI3mPZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nJiUzfkTHCKBBfg8XIQCTDZ/MFq5SlG9KachQtOFHnBAit/I2FbFGjE3Kd9XjjAQCYGSZ3dUwaBee//gp07lKLZGIxZUuCZCQ98grsW8OpzhNh2DzSw2ez3VAwEpTGecnch3gnuuxZ7GJSysa12L1lDAbFz4y4L7RmVdl4PZlw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-52096b4e163so1137065e0c.1;
        Wed, 19 Feb 2025 05:06:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739970399; x=1740575199;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fYhTwYeXqAJKyGhCN8eDvatXjt1uhCO95mIaKEuk030=;
        b=XTzavMGm7wFMkxKUKqLJFcbQgrpf5ZuDrt4KxCCq9uerN280gSNeWhKofqxNpOW+Rb
         IrKKn9IpSv/Nb3Vl/AIMnsWOQbWNvnFpnrhUfChNkNOaF1bqlW98l51UBAofRtX+nZvU
         hu1vUvmBwZEHVLzRbSv5fKjN2Gw4JboPwkGbARosOzTqrGUk2zOFigEyIfUaGoDktaM9
         ZC1DL/EBFf31vsTQz4LFDL2DPSkODB5WRDv1LB34Q9t6Ggvk2YLsH7Wr0hZGXrRpC4JX
         PfTApF75uUa27SEf3buMTx5vFsB8Os//P8p0hQj80pWaV5dz8Mg4bDqfxXtl0QfWO2N6
         d/cw==
X-Forwarded-Encrypted: i=1; AJvYcCVluxoVLwspRPH0lHzA7sUk9ZoKeLu4BCTqKoOeNux6pX5q1s9Z18fnUxlb8EYz5TzJWAqDUEw8Fi/3ZE4=@vger.kernel.org, AJvYcCXWxW+TqoN261/3iKq8S05iMAOL7VRtZGMbwuCGoWge7Y0kwuYfXn6TnKS5F7M9RWJZ42vMXN2q0fsd9lc1@vger.kernel.org, AJvYcCXn1OJpE25VhxFGHOwiu1qtEqFknmUPz2XFtJLXcJPJaS7biC64r2p+gu6P+1MoZo7927hLKQnBPDAnHb7F/2sgh5E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxB9ihnFvIwosi7F6MJkPkpQs/knJwUJn+5StRkyf3NAuLNw6RK
	CFmPcw9giKhL0oW/rDasNz08a2mJmy8ESz8/FAW4j9RKzuj4SWN8uT9pY16O
X-Gm-Gg: ASbGncuES4V/VjztcX9d3kD8zzhNFej9DnWGwjPWVmCTglmC/nPBjJhEvPH3OcEacuO
	Y3bL34bLGy9l2SBOzZkzSjrQrXP7CTPZckUC3q/S+RykB0W+MlA3prQnHqaNXRMJuew8YqlydSZ
	yGBiAiQ49wNxKo6I3UFJ4fhiIJTbzc64F0ptk40z9ZimctW55ABY/PZfCFLCAmKGNi+L9pOWJGE
	RfNFYQ+UF0TnKOe3Cr6sEzGbDpfXsbiicMSIejjvhfg6iFekEG9uK1pOe5b7J4fWXHusRjvY15/
	HBwDrVLIBY1RCxEg4ehISV99qv8/HP2q0hqgL675N0zelEv/QfWYuw==
X-Google-Smtp-Source: AGHT+IEsacBaJ2Ny4jHacgq90sndW3LIb1cdaHDcf9Vx3ExkynS37IhJiPNch8dNvvblQxs7iuGRBg==
X-Received: by 2002:a05:6122:d16:b0:520:3536:fea5 with SMTP id 71dfb90a1353d-5209dd0ee77mr10209878e0c.6.1739970399085;
        Wed, 19 Feb 2025 05:06:39 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-521ad89a861sm1286736e0c.40.2025.02.19.05.06.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 05:06:38 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4be707fffbcso683346137.0;
        Wed, 19 Feb 2025 05:06:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU+g61zX1G6gOwjPXBAH3KznvWQCauByA5IoK9DVPPPtzHzPeFV6vhAG5L8XKPoV5Sk0q/FDoFq1F2bMB3NJMTnyPk=@vger.kernel.org, AJvYcCUlHxj29L0+KlVks1fjIpiKkB37q/2AAbHe923+HT9xtYkRqooo+GtHtpgmP/hpKo55SJdW/c190nyePLVg@vger.kernel.org, AJvYcCWLENY9iWTegIzCUT7AUNYeMtt7rpfOc1y8PPJcCtUaRhfPQ4BcgySmYQtRTgcjQexaUCrgaTCrfnudmSY=@vger.kernel.org
X-Received: by 2002:a05:6102:f12:b0:4bd:3519:44be with SMTP id
 ada2fe7eead31-4bd3fdd5f20mr9254850137.15.1739970397187; Wed, 19 Feb 2025
 05:06:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250217105354.551788-1-thierry.bultel.yh@bp.renesas.com> <20250217105354.551788-9-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250217105354.551788-9-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Feb 2025 14:06:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUVj4y4=cZmtxJj29pCE55YhnL27TWLiBOdvY4Vd98YGA@mail.gmail.com>
X-Gm-Features: AWEUYZmBYOoucKsuXlh4a7ET4jJeCcRJIwsBym5cJAlAxiyi4aoQeFA-RAXh2kg
Message-ID: <CAMuHMdUVj4y4=cZmtxJj29pCE55YhnL27TWLiBOdvY4Vd98YGA@mail.gmail.com>
Subject: Re: [PATCH v2 08/13] serial: sh-sci: Introduced function pointers
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thierry,

Thanks for your patch!

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

I more like this name than the actual file name "sh-sci_common.h" ;-)

> implementation in a separate file, to keep this driver as little
> changed as possible.
>
> For doing so, a set of 'ops' is added to struct sci_port.
>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>

I did a rather thorough review while investigating why this patch
broke SuperH...

> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -76,101 +64,39 @@ enum {
>         ((port)->irqs[SCIx_ERI_IRQ] &&  \
>          ((port)->irqs[SCIx_RXI_IRQ] < 0))
>
> -enum SCI_CLKS {
> -       SCI_FCK,                /* Functional Clock */
> -       SCI_SCK,                /* Optional External Clock */
> -       SCI_BRG_INT,            /* Optional BRG Internal Clock Source */
> -       SCI_SCIF_CLK,           /* Optional BRG External Clock Source */
> -       SCI_NUM_CLKS
> -};
> -
> -/* Bit x set means sampling rate x + 1 is supported */
> -#define SCI_SR(x)              BIT((x) - 1)
>  #define SCI_SR_RANGE(x, y)     GENMASK((y) - 1, (x) - 1)
>
>  #define SCI_SR_SCIFAB          SCI_SR(5) | SCI_SR(7) | SCI_SR(11) | \
>                                 SCI_SR(13) | SCI_SR(16) | SCI_SR(17) | \
>                                 SCI_SR(19) | SCI_SR(27)
>
> -#define min_sr(_port)          ffs((_port)->sampling_rate_mask)
> -#define max_sr(_port)          fls((_port)->sampling_rate_mask)
> -
>  /* Iterate over all supported sampling rates, from high to low */
>  #define for_each_sr(_sr, _port)                                                \
>         for ((_sr) = max_sr(_port); (_sr) >= min_sr(_port); (_sr)--)    \
>                 if ((_port)->sampling_rate_mask & SCI_SR((_sr)))
>
> -struct plat_sci_reg {
> -       u8 offset, size;
> -};
> -
> -struct sci_port_params {
> -       const struct plat_sci_reg regs[SCIx_NR_REGS];

This was the sole user of SCIx_NR_REGS, so the latter can be removed.

> -       unsigned int fifosize;
> -       unsigned int overrun_reg;
> -       unsigned int overrun_mask;
> -       unsigned int sampling_rate_mask;
> -       unsigned int error_mask;
> -       unsigned int error_clear;
> -};
> -
> -struct sci_port {
> -       struct uart_port        port;
> -
> -       /* Platform configuration */
> -       const struct sci_port_params *params;
> -       const struct plat_sci_port *cfg;
> -       unsigned int            sampling_rate_mask;
> -       resource_size_t         reg_size;
> -       struct mctrl_gpios      *gpios;
> -
> -       /* Clocks */
> -       struct clk              *clks[SCI_NUM_CLKS];
> -       unsigned long           clk_rates[SCI_NUM_CLKS];
> -
> -       int                     irqs[SCIx_NR_IRQS];
> -       char                    *irqstr[SCIx_NR_IRQS];
> -
> -       struct dma_chan                 *chan_tx;
> -       struct dma_chan                 *chan_rx;
> -
> -#ifdef CONFIG_SERIAL_SH_SCI_DMA
> -       struct dma_chan                 *chan_tx_saved;
> -       struct dma_chan                 *chan_rx_saved;
> -       dma_cookie_t                    cookie_tx;
> -       dma_cookie_t                    cookie_rx[2];
> -       dma_cookie_t                    active_rx;
> -       dma_addr_t                      tx_dma_addr;
> -       unsigned int                    tx_dma_len;
> -       struct scatterlist              sg_rx[2];
> -       void                            *rx_buf[2];
> -       size_t                          buf_len_rx;
> -       struct work_struct              work_tx;
> -       struct hrtimer                  rx_timer;
> -       unsigned int                    rx_timeout;     /* microseconds */
> -#endif
> -       unsigned int                    rx_frame;
> -       int                             rx_trigger;
> -       struct timer_list               rx_fifo_timer;
> -       int                             rx_fifo_timeout;
> -       u16                             hscif_tot;
> -
> -       bool has_rtscts;
> -       bool autorts;
> -       bool tx_occurred;
> -};
> -
>  #define SCI_NPORTS CONFIG_SERIAL_SH_SCI_NR_UARTS
>
>  static struct sci_port sci_ports[SCI_NPORTS];
>  static unsigned long sci_ports_in_use;
>  static struct uart_driver sci_uart_driver;
>
> -static inline struct sci_port *
> -to_sci_port(struct uart_port *uart)
> -{
> -       return container_of(uart, struct sci_port, port);
> -}
> +static const struct sci_port_params_bits sci_sci_port_params_bits = {
> +       .rxtx_enable = SCSCR_RE | SCSCR_TE,
> +       .te_clear = SCSCR_TE | SCSCR_TEIE,
> +       .poll_sent_bits = SCI_FER | SCI_TEND

s/SCI_FER/SCI_TDRE/

Cfr.

#define SCxSR_TDxE(port)    (((port)->type == PORT_SCI) ? SCI_TDRE   :
SCIF_TDFE)

> +};
> +
> +static const struct sci_port_params_bits sci_scix_port_params_bits = {

I'd rather call this sci_scif_port_params_bits, as it is used by all
SCIF variants (IRDA is sort-of SH3 SCIF).

> +       .rxtx_enable = SCSCR_RE | SCSCR_TE,
> +       .te_clear = SCSCR_TE | SCSCR_TEIE,
> +       .poll_sent_bits = SCIF_TDFE | SCIF_TEND
> +};
> +
> +static const struct sci_common_regs sci_common_regs = {
> +       .status = SCxSR,
> +       .control = SCSCR,
> +};
>
>  static const struct sci_port_params sci_port_params[SCIx_NR_REGTYPES] = {
>         /*

> @@ -713,15 +667,16 @@ static void sci_clear_SCxSR(struct uart_port *port, unsigned int mask)
>      defined(CONFIG_SERIAL_SH_SCI_EARLYCON)
>
>  #ifdef CONFIG_CONSOLE_POLL
> -static int sci_poll_get_char(struct uart_port *port)
> +int sci_poll_get_char(struct uart_port *port)

As rzsci.c does not call this, I think it can stay static...

>  {
>         unsigned short status;
> +       struct sci_port *s = to_sci_port(port);
>         int c;
>
>         do {
>                 status = sci_serial_in(port, SCxSR);
>                 if (status & SCxSR_ERRORS(port)) {
> -                       sci_clear_SCxSR(port, SCxSR_ERROR_CLEAR(port));
> +                       s->ops->clear_SCxSR(port, SCxSR_ERROR_CLEAR(port));
>                         continue;
>                 }
>                 break;

> @@ -1623,7 +1582,7 @@ static struct dma_chan *sci_request_dma_chan(struct uart_port *port,
>         return chan;
>  }
>
> -static void sci_request_dma(struct uart_port *port)
> +void sci_request_dma(struct uart_port *port)

Likewise.

>  {
>         struct sci_port *s = to_sci_port(port);
>         struct tty_port *tport = &port->state->port;
> @@ -1711,7 +1670,7 @@ static void sci_request_dma(struct uart_port *port)
>         }
>  }
>
> -static void sci_free_dma(struct uart_port *port)
> +void sci_free_dma(struct uart_port *port)

Likewise

>  {
>         struct sci_port *s = to_sci_port(port);
>
> @@ -1721,7 +1680,7 @@ static void sci_free_dma(struct uart_port *port)
>                 sci_dma_rx_release(s);
>  }
>
> -static void sci_flush_buffer(struct uart_port *port)
> +void sci_flush_buffer(struct uart_port *port)

Not need if rzsci.c does not use DMA yet.

>  {
>         struct sci_port *s = to_sci_port(port);
>
> @@ -1750,11 +1709,11 @@ static void sci_dma_check_tx_occurred(struct sci_port *s)
>                 s->tx_occurred = true;
>  }
>  #else /* !CONFIG_SERIAL_SH_SCI_DMA */
> -static inline void sci_request_dma(struct uart_port *port)
> +inline void sci_request_dma(struct uart_port *port)

Non-static inline?

>  {
>  }
>
> -static inline void sci_free_dma(struct uart_port *port)
> +inline void sci_free_dma(struct uart_port *port)

Likewise

>  {
>  }
>
> @@ -1762,7 +1721,9 @@ static void sci_dma_check_tx_occurred(struct sci_port *s)
>  {
>  }
>
> -#define sci_flush_buffer       NULL
> +inline void sci_flush_buffer(struct uart_port *port)

Why?

> +{
> +}
>  #endif /* !CONFIG_SERIAL_SH_SCI_DMA */
>
>  static irqreturn_t sci_rx_interrupt(int irq, void *ptr)

> @@ -1837,16 +1799,19 @@ static irqreturn_t sci_tx_interrupt(int irq, void *ptr)
>  static irqreturn_t sci_tx_end_interrupt(int irq, void *ptr)
>  {
>         struct uart_port *port = ptr;
> +       struct sci_port *s = to_sci_port(port);
> +       const struct sci_common_regs *regs = s->params->common_regs;
>         unsigned long flags;
> -       unsigned short ctrl;
> +       u32 ctrl;
>
>         if (port->type != PORT_SCI)
>                 return sci_tx_interrupt(irq, ptr);
>
>         uart_port_lock_irqsave(port, &flags);
> -       ctrl = sci_serial_in(port, SCSCR);
> -       ctrl &= ~(SCSCR_TE | SCSCR_TEIE);
> -       sci_serial_out(port, SCSCR, ctrl);
> +       ctrl = s->ops->read_reg(port, regs->control);
> +
> +       ctrl &= ~(s->params->param_bits->te_clear);

As you only ever use ~te_clear, please move the ~ to the initialization.

> +       s->ops->write_reg(port, regs->control, ctrl);
>         uart_port_unlock_irqrestore(port, flags);
>
>         return IRQ_HANDLED;

> @@ -2059,7 +2025,7 @@ static int sci_request_irq(struct sci_port *port)
>         return ret;
>  }
>
> -static void sci_free_irq(struct sci_port *port)
> +void sci_free_irq(struct sci_port *port)

As rzsci.c does not call this, I think it can stay static...

>  {
>         int i, j;
>
> @@ -2232,7 +2198,7 @@ static unsigned int sci_get_mctrl(struct uart_port *port)
>         return mctrl;
>  }
>
> -static void sci_enable_ms(struct uart_port *port)
> +void sci_enable_ms(struct uart_port *port)

Likewise

>  {
>         mctrl_gpio_enable_ms(to_sci_port(port)->gpios);
>  }

> @@ -2383,9 +2352,9 @@ static int sci_brg_calc(struct sci_port *s, unsigned int bps,
>  }
>
>  /* calculate sample rate, BRR, and clock select */
> -static int sci_scbrr_calc(struct sci_port *s, unsigned int bps,
> -                         unsigned int *brr, unsigned int *srr,
> -                         unsigned int *cks)
> +int sci_scbrr_calc(struct sci_port *s, unsigned int bps,

Likewise.

> +                  unsigned int *brr, unsigned int *srr,
> +                  unsigned int *cks)
>  {
>         unsigned long freq = s->clk_rates[SCI_FCK];
>         unsigned int sr, br, prediv, scrate, c;

> @@ -2881,6 +2861,19 @@ static const struct uart_ops sci_uart_ops = {
>  #endif
>  };
>
> +static const struct sci_port_ops sci_port_ops = {
> +       .read_reg               = sci_serial_in,
> +       .write_reg              = sci_serial_out,
> +       .receive_chars          = sci_receive_chars,
> +       .transmit_chars         = sci_transmit_chars,
> +       .poll_put_char          = sci_poll_put_char,
> +       .clear_SCxSR            = sci_clear_SCxSR,
> +       .set_rtrg               = scif_set_rtrg,
> +       .rtrg_enabled           = scif_rtrg_enabled,
> +       .shutdown_complete      = sci_shutdown_complete,
> +       .prepare_console_write  = sci_prepare_console_write,
> +};

Please initialize all members in the same order as in the structure's
definition in the header file.

> +
>  static int sci_init_clocks(struct sci_port *sci_port, struct device *dev)
>  {
>         const char *clk_names[] = {

> @@ -3119,21 +3115,21 @@ static void serial_console_write(struct console *co, const char *s,
>                 uart_port_lock_irqsave(port, &flags);
>
>         /* first save SCSCR then disable interrupts, keep clock source */
> -       ctrl = sci_serial_in(port, SCSCR);
> -       ctrl_temp = SCSCR_RE | SCSCR_TE |
> -                   (sci_port->cfg->scscr & ~(SCSCR_CKE1 | SCSCR_CKE0)) |
> -                   (ctrl & (SCSCR_CKE1 | SCSCR_CKE0));
> -       sci_serial_out(port, SCSCR, ctrl_temp | sci_port->hscif_tot);
> +
> +       ctrl = sci_port->ops->read_reg(port, regs->control);
> +       sci_port->ops->prepare_console_write(port, ctrl);
>
>         uart_console_write(port, s, count, serial_console_putchar);
>
>         /* wait until fifo is empty and last bit has been transmitted */
> -       bits = SCxSR_TDxE(port) | SCxSR_TEND(port);
> -       while ((sci_serial_in(port, SCxSR) & bits) != bits)
> +
> +       bits = sci_ports->params->param_bits->poll_sent_bits;

s/sci_ports/sci_port/

Else it crashes on e.g. RTS7751R2D (qemu-system-sh4 -M r2d) and Landisk,
where the serial console is ttySC1.

> +
> +       while ((sci_port->ops->read_reg(port, regs->status) & bits) != bits)
>                 cpu_relax();
>
>         /* restore the SCSCR */
> -       sci_serial_out(port, SCSCR, ctrl);
> +       sci_port->ops->write_reg(port, regs->control, ctrl);
>
>         if (locked)
>                 uart_port_unlock_irqrestore(port, flags);

> @@ -3564,9 +3559,11 @@ sh_early_platform_init_buffer("earlyprintk", &sci_driver,
>  #ifdef CONFIG_SERIAL_SH_SCI_EARLYCON
>  static struct plat_sci_port port_cfg __initdata;
>
> -static int __init early_console_setup(struct earlycon_device *device,
> +int __init early_console_setup(struct earlycon_device *device,

The name of this function is too generic to make it global.

>                                       int type)
>  {
> +       const struct sci_common_regs *regs;
> +
>         if (!device->port.membase)
>                 return -ENODEV;
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


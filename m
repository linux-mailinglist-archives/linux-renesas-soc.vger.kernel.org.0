Return-Path: <linux-renesas-soc+bounces-24705-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B450C686E3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 10:08:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3D6D24E321A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 09:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD5F03002BC;
	Tue, 18 Nov 2025 09:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RJYfUWwv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C07207A3A;
	Tue, 18 Nov 2025 09:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763456790; cv=none; b=mNswsja0BBTL7oKkORcRMcO0PH5SEAB27fLmXa1aH2lwzBfnjwlI/BXEinVEpZg6/AJ60iY95svtVYDU7l6cYtJg/To5nXO0mZqkPVf0qPNUgYbfH/ajSsFl5ymmVs/OFYyVmzNVpx3ySjyzZ8B+gGZLoxI52ETw5mUWfxZrcN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763456790; c=relaxed/simple;
	bh=DHQzKWh6oHuXIueNb9XjYUNjZqvdGxJwdXVrZB2F6Xk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V5vZnagEOYtPx7yDhqbiCATJYylesjIpAnP1M9THr2W6kjTmUeLg/szSi3QJJA251YT6tPRhLGNuh01mBVvyNYtCTjvF7EKvdzEx9O0uzn648bDgH3o3Io2nx0iIrPHfHVsLOK0gJMdvfrtkIwQXZrMc2d+Jd8ufviWyvoFwZ48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RJYfUWwv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDCA2C19422;
	Tue, 18 Nov 2025 09:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763456789;
	bh=DHQzKWh6oHuXIueNb9XjYUNjZqvdGxJwdXVrZB2F6Xk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RJYfUWwvFbi8xVUFLdbZ8UDqB2hSifG53imgfOb6kTFoCAGB4qUXtHmIfFJdv7DVQ
	 mvr7i/cYdT3h+z7UB3urpj5wvfIkUbfJpOOZMNqDnF6N945hzg8qcKLFeqFGzoPuOW
	 9mV4J5oBm/qO8keoKIpko7MlfjZRAxtskNFOG7i77JNjCnvN0CKhqeSMOiSD/rPg6d
	 YMd1gvjpr5yPYp2OlUnkT3hlRI724SpSsbZMHKPJDb6wMzrLqCCW2HH802qya/WR/X
	 /VUhW1YfdY/0Ti3Lv7TdogOrBk3Gpf/UOFRm01d5z8tyBrrDzWxpPQPC8jnutCrbst
	 ijCBYajIIhtZg==
Message-ID: <e4bd468f-6d66-4658-b69f-0dacf006d1a8@kernel.org>
Date: Tue, 18 Nov 2025 10:06:23 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/13] serial: sh-sci: Add support for RZ/G3E RSCI SCI
To: Biju <biju.das.au@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20251114105201.107406-1-biju.das.jz@bp.renesas.com>
 <20251114105201.107406-14-biju.das.jz@bp.renesas.com>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <20251114105201.107406-14-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 14. 11. 25, 11:51, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Add support for RZ/G3E RSCI SCI(a.k.a non FIFO mode).

"a.k.a. non-FIFO"

> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
...
> @@ -496,34 +521,40 @@ static void rsci_receive_chars(struct uart_port *port)
>   		if (count == 0)
>   			break;
>   
> -		for (i = 0; i < count; i++) {
> -			char c;
> -
> -			rdat = rsci_serial_in(port, RDR);
> -			/* 9-bits data is not supported yet */
> -			c = rdat & RDR_RDAT_MSK;
> -
> -			if (uart_handle_sysrq_char(port, c)) {
> -				count--;
> -				i--;
> -				continue;
> -			}
> -
> -			/*
> -			 * Store data and status.
> -			 * Non FIFO mode is not supported
> -			 */
> -			if (rdat & RDR_FFER) {
> -				flag = TTY_FRAME;
> -				port->icount.frame++;
> -			} else if (rdat & RDR_FPER) {
> -				flag = TTY_PARITY;
> -				port->icount.parity++;
> -			} else {
> -				flag = TTY_NORMAL;
> +		if (s->type == RSCI_PORT_SCI) {
> +			char c = rsci_serial_in(port, RDR) & RDR_RDAT_MSK;
> +
> +			if (uart_handle_sysrq_char(port, c))
> +				count = 0;
> +			else
> +				tty_insert_flip_char(tport, c, TTY_NORMAL);
> +		} else {
> +			for (i = 0; i < count; i++) {
> +				char c;
> +
> +				rdat = rsci_serial_in(port, RDR);
> +				/* 9-bits data is not supported yet */
> +				c = rdat & RDR_RDAT_MSK;
> +
> +				if (uart_handle_sysrq_char(port, c)) {
> +					count--;
> +					i--;
> +					continue;
> +				}
> +
> +				/* Store data and status */
> +				if (rdat & RDR_FFER) {
> +					flag = TTY_FRAME;
> +					port->icount.frame++;
> +				} else if (rdat & RDR_FPER) {
> +					flag = TTY_PARITY;
> +					port->icount.parity++;
> +				} else {
> +					flag = TTY_NORMAL;
> +				}
> +
> +				tty_insert_flip_char(tport, c, flag);
>   			}

Instead of this shuffle and introducing the 'if', can't you just set 
count to 1 and introduce a mask like:

if (SCI) {
   count = 1;
   read_mask = RDR_RDAT_MSK;
} else  {
   read_mask = ~0U;
}

for (...) {
   ...
   rdat = rsci_serial_in(port, RDR) & read_mask;
}
and that's it?

thanks,
-- 
js
suse labs


Return-Path: <linux-renesas-soc+bounces-23884-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6E8C1CD06
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 19:44:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A994188F794
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 18:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA1B83563EB;
	Wed, 29 Oct 2025 18:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sfi8bWiO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957342BE7DF
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 18:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761763472; cv=none; b=o+iOIsdjzqMDulVMuCnrwh+slBhPUYeUwvoXjZXXdXrDzT17tIRr8HDNpYYdOAB+033QT8HUoPiTEnaxAwlBe2b8F5f92ZcH3zrbGGcEygvea/g0BVdNp0VczfNq6pfScBWw60D4nqwtFBNzF5uFBunQBtw1QJPs+Zw4onXN6DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761763472; c=relaxed/simple;
	bh=X5SGW0P3JJzrz7DuS3Cd280Zktggm7aD62MiExGdpDk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YrGfNMpVgxDnWWCIxx62WMyzAu5C/mWlIoQSGVec8hATsAi4xpSAh7A79UhGUY4HA4O35jDRpmnF/doP68f2cm8WHWiMGLNf+OwLbRQGWuuY2/1Ms7KpEQ9JVJBdPkPMRZLcDjUK2UEJIPOzk1TKj+zNHuNMxfpXTf/Rbb68rWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sfi8bWiO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30FC8C19423
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 18:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761763472;
	bh=X5SGW0P3JJzrz7DuS3Cd280Zktggm7aD62MiExGdpDk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Sfi8bWiON9HRF9blSn1oQwIKJT3qMkaLlwJnpxCCdnX2wwdtHHcnM/J3lTJjezMkk
	 2izcN7ddBROoABgF3+5RBcSkh7UqHnWrXqKH19MxJfIiD9wh4Ts47gOHYsh6+0JFQ1
	 1IxNCGX8qx/H/ICLsKNwAit/8zdM7T6GdqoIJG/N0LxSguA0q9YlnH4Q8cLTOpSJIL
	 +8QPzUMfOJ0eJ4F+BRs3FvVXrkg6oCLwR5aCe/HX5XTEhbYgpsu49Oibmwf2w2osr4
	 F0q+5hx1r5d8pEM0CYW6sVGXywrzQkPiRn7+SyvdWKHs7GOl8jenowmmgyMg9+p0Yt
	 FlyEMlqx5sCGQ==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-63c31c20b64so187363a12.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 11:44:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVL8O6WENopq5EOIlRp5eH87J2m+kUfhg2tYcaU8UFFlcodU0hJ5KjpOze3J5bJMsD+cNyF+fLjzDDSN2ngieO6ig==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrCJNiWXS7YcdT4E31BAbLuQNTVmC+ojMeGlFftLJK+0teV2A7
	btqFEp8P9kDVYFr6HwDq2jXW4Qok8AYNMawEdvCkORyeMEX1ukx5vWGaDWgn4ntwzr2Ffwp0y3a
	axS6/eJn4mdcOj0eBIoqG2BPYw0uzzw==
X-Google-Smtp-Source: AGHT+IHlozFQ+JQwVLKlwquKBWRdEGQaGh+w5cVLhOZx4kgBjIYxdNW+akeS9KdA3nUYZn7uCdUcWJ8myW0EIgqemA0=
X-Received: by 2002:a05:6402:3041:20b0:637:e271:8087 with SMTP id
 4fb4d7f45d1cf-64061a5a3e0mr188103a12.18.1761763470629; Wed, 29 Oct 2025
 11:44:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250904210147.186728-1-marek.vasut+renesas@mailbox.org>
 <20250904210147.186728-4-marek.vasut+renesas@mailbox.org> <4ffcf4fc-17a9-4669-af07-f81ddb46aee9@ideasonboard.com>
 <d76ff19c-7b0f-4aa9-8ae2-d08c82d70410@mailbox.org> <aebc10ec-73ed-4843-95c5-9ba5a2759ccb@ideasonboard.com>
 <b4c0e78a-eecb-4a18-9199-18ea91c8df31@mailbox.org> <2da374d1-7557-4f7e-9160-86945b73731a@ideasonboard.com>
 <14e5da7c-c6ce-4bb6-884b-08629f5a5788@mailbox.org> <7a159b09-d957-4d9b-9460-adf62df9a440@mailbox.org>
 <626acab8-46ae-44cf-b9ef-0ac78d0954c9@ideasonboard.com>
In-Reply-To: <626acab8-46ae-44cf-b9ef-0ac78d0954c9@ideasonboard.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 29 Oct 2025 13:44:19 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKFs=vwYDnRgj3YJ66Y8ktSWOUY-kkUVHFZKa4MBj8-+g@mail.gmail.com>
X-Gm-Features: AWmQ_bmStg1mWI38sVfvCoid1e3VOtjQKHHZzU438WGxmHA8RrCOgTgf3EJykGs
Message-ID: <CAL_JsqKFs=vwYDnRgj3YJ66Y8ktSWOUY-kkUVHFZKa4MBj8-+g@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] dt-bindings: display: bridge: renesas,dsi-csi2-tx:
 Allow panel@ subnode
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Marek Vasut <marek.vasut@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 2:19=E2=80=AFAM Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
>
> Hi,
>
> On 15/10/2025 17:09, Marek Vasut wrote:
> > On 9/19/25 7:08 PM, Marek Vasut wrote:
> >
> > Hello Tomi,
> >
> >>>>> Ok. My point was just that the dsi-controller.yaml doesn't allow
> >>>>> "bridge" node (you can just rename the panel to bridge to test). I
> >>>>> thought someone (I just can't remember who was it =3D) will send a =
patch
> >>>>> for it, but I think that hasn't happened.
> >>>> Do you want me to drop the bridge part from the commit message (I
> >>>> assume
> >>>> yes) ?
> >>>>
> >>>> Any other change I should do before sending a V3 ?
> >>>
> >>> As we found out, this has been fixed in linux-next. For this, and the
> >>> rest in this series:
> >>>
> >>> Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >>
> >> Understood, thank you.
> > Do you think this 4/4 can now be applied ? The rest already is.
>
> Pushed to drm-misc-next.

And now a warning in linux-next:

/builds/robherring/linux-dt/Documentation/devicetree/bindings/display/bridg=
e/renesas,dsi-csi2-tx.example.dtb:
panel@0 (raspberrypi,dsi-7inch): compatible: ['raspberrypi,dsi-7inch']
is too short
        from schema $id:
http://devicetree.org/schemas/display/panel/ilitek,ili9881c.yaml
/builds/robherring/linux-dt/Documentation/devicetree/bindings/display/bridg=
e/renesas,dsi-csi2-tx.example.dtb:
panel@0 (raspberrypi,dsi-7inch): 'power-supply' is a required property
        from schema $id:
http://devicetree.org/schemas/display/panel/ilitek,ili9881c.yaml

Please revert or figure out the fix.

Rob

